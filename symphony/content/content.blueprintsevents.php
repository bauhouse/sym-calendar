<?php

	require_once(TOOLKIT . '/class.administrationpage.php');
	require_once(TOOLKIT . '/class.eventmanager.php');	
	require_once(TOOLKIT . '/class.sectionmanager.php');
	
	Class contentBlueprintsEvents extends AdministrationPage{
		
		function __viewNew(){
			$this->__form();			
		}
		
		function __viewEdit(){
			$this->__form();
		}
		
		function __viewInfo(){
			$this->__form(true);	
		}
		
		function __form($readonly=false){

			$formHasErrors = (is_array($this->_errors) && !empty($this->_errors));
			
			if($formHasErrors) $this->pageAlert('An error occurred while processing this form. <a href="#error">See below for details.</a>', AdministrationPage::PAGE_ALERT_ERROR);

			if(isset($this->_context[2])){
				switch($this->_context[2]){
					
					case 'saved':
						$this->pageAlert('{1} updated successfully. <a href="'.URL.'/symphony/{2}">Create another?</a>', AdministrationPage::PAGE_ALERT_NOTICE, array('Event', 'blueprints/events/new/'));
						break;
						
					case 'created':
						$this->pageAlert('{1} created successfully. <a href="'.URL.'/symphony/{2}">Create another?</a>', AdministrationPage::PAGE_ALERT_NOTICE, array('Event', 'blueprints/events/new/'));
						break;
					
				}
			}

			$isEditing = ($readonly ? true : false);
			$fields = array();
			
			$sectionManager = new SectionManager($this->_Parent);
			
			if($this->_context[0] == 'edit' || $this->_context[0] == 'info'){	
				$isEditing = true;
				
				$handle = $this->_context[1];
				
				$EventManager = new EventManager($this->_Parent);
				$existing =& $EventManager->create($handle);
				
				$about = $existing->about();
				
				$fields['name'] = $about['name'];
				$fields['source'] = $existing->getSource();
				$fields['filters'] = $existing->eParamFILTERS;
			}
			
			if(isset($_POST['fields'])) $fields = $_POST['fields'];
			
			$this->setPageType('form');	
			$this->setTitle('Symphony &ndash; Events' . ($isEditing ? ' &ndash; ' . $about['name'] : NULL));
			$this->appendSubheading(($isEditing ? $about['name'] : 'Untitled'));
			
			if(!$readonly):
				$fieldset = new XMLElement('fieldset');
				$fieldset->setAttribute('class', 'settings');
				$fieldset->appendChild(new XMLElement('legend', 'Essentials'));

				$div = new XMLElement('div');
				$div->setAttribute('class', 'group');
			
				$label = Widget::Label('Name');
				$label->appendChild(Widget::Input('fields[name]', General::sanitize($fields['name'])));
			
				if(isset($this->_errors['name'])) $div->appendChild(Widget::wrapFormElementWithError($label, $this->_errors['name']));
				else $div->appendChild($label);
			
				$label = Widget::Label('Source');	
			
			    $sections = $sectionManager->fetch(NULL, 'ASC', 'name');
			
				$options = array();
			
				if(is_array($sections) && !empty($sections)){
					foreach($sections as $s) $options[] = array($s->get('id'), ($fields['source'] == $s->get('id')), $s->get('name'));
				}
			
				$label->appendChild(Widget::Select('fields[source]', $options, array('id' => 'context')));
				$div->appendChild($label);
			
				$fieldset->appendChild($div);
			
				$label = Widget::Label('Filter Rules');	

				$options = array(
					array('admin-only', @in_array('admin-only', $fields['filters']), 'Admin Only'),
					array('send-email', @in_array('send-email', $fields['filters']), 'Send Email'),
					array('expect-multiple', @in_array('expect-multiple', $fields['filters']), 'Allow Multiple'),					
				);
			
				###
				# Delegate: AppendEventFilter
				# Description: Allows adding of new filter rules to the Event filter rule select box. A reference to the $options array is provided, and selected filters
				$this->_Parent->ExtensionManager->notifyMembers('AppendEventFilter', '/blueprints/events/' . $this->_context[0] . '/', array('selected' => $fields['filters'], 'options' => &$options));
			
				$label->appendChild(Widget::Select('fields[filters][]', $options, array('multiple' => 'multiple')));
				$fieldset->appendChild($label);		
			
				$fieldset->appendChild(new XMLElement('p', 'This event will not be processed if any of these rules return true.', array('class' => 'help')));
			
				$this->Form->appendChild($fieldset);
			endif;
			
			if($isEditing):
				$fieldset = new XMLElement('fieldset');
				$fieldset->setAttribute('class', 'settings');

				$doc = $existing->documentation();
				$fieldset->setValue('<legend>Description</legend>' . self::CRLF . General::tabsToSpaces((is_object($doc) ? $doc->generate(true) : $doc), 2));

				$this->Form->appendChild($fieldset);
			endif;
			
			$div = new XMLElement('div');
			$div->setAttribute('class', 'actions');
			$div->appendChild(Widget::Input('action[save]', ($isEditing ? 'Save Changes' : 'Create Event'), 'submit', array('accesskey' => 's')));
			
			if($isEditing){
				$button = new XMLElement('button', 'Delete');
				$button->setAttributeArray(array('name' => 'action[delete]', 'class' => 'confirm delete', 'title' => 'Delete this event'));
				$div->appendChild($button);
			}
			
			if(!$readonly) $this->Form->appendChild($div);	
						
		}
		
		function __actionNew(){
			if(array_key_exists('save', $_POST['action'])) return $this->__formAction();
		}
		
		function __actionEdit(){
			if(array_key_exists('save', $_POST['action'])) return $this->__formAction();
			elseif(array_key_exists('delete', $_POST['action'])){
				
				## TODO: Fix Me
				###
				# Delegate: Delete
				# Description: Prior to deleting the event file. Target file path is provided.
				#$ExtensionManager->notifyMembers('Delete', getCurrentPage(), array("file" => EVENTS . "/event." . $_REQUEST['file'] . ".php"));

		    	if(!General::deleteFile(EVENTS . '/event.' . $this->_context[1] . '.php'))
					$this->pageAlert('Failed to delete <code>'.$this->_context[1].'</code>. Please check permissions.', AdministrationPage::PAGE_ALERT_ERROR);

		    	else redirect(URL . '/symphony/blueprints/components/');
						
			}	
		}
		
		function __formAction(){
			$fields = $_POST['fields'];
			
			$this->_errors = array();
			
			if(trim($fields['name']) == '') $this->_errors['name'] = 'This is a required field';
			
			$classname = Lang::createHandle($fields['name'], NULL, '_', false, true, array('@^[^a-z]+@i' => '', '/[^\w-\.]/i' => ''));
			$rootelement = str_replace('_', '-', $classname);
			
			$file = EVENTS . '/event.' . $classname . '.php';
			
			$isDuplicate = false;
			$queueForDeletion = NULL;
			
			if($this->_context[0] == 'new' && @is_file($file)) $isDuplicate = true;
			elseif($this->_context[0] == 'edit'){
				$existing_handle = $this->_context[1];
				if($classname != $existing_handle && @is_file($file)) $isDuplicate = true;
				elseif($classname != $existing_handle) $queueForDeletion = EVENTS . '/event.' . $existing_handle . '.php';
			}
			
			##Duplicate
			if($isDuplicate) $this->_errors['name'] = 'An Event with the name <code>'.$classname.'</code> name already exists';
			
			if(empty($this->_errors)){
				
				$multiple = @in_array('expect-multiple', $fields['filters']);
				
				$eventShell = file_get_contents(TEMPLATE . '/event.tpl');
				
				$about = array(
					'name' => $fields['name'],
					'version' => '1.0',
					'release date' => DateTimeObj::getGMT('c'),
					'author name' => $this->_Parent->Author->getFullName(),
					'author website' => URL,
					'author email' => $this->_Parent->Author->get('email'),
					'trigger condition' => $rootelement
				);

				$source = $fields['source'];
				
				$filter = NULL;
				$elements = NULL;
				$this->__injectAboutInformation($eventShell, $about);
				$this->__injectFilters($eventShell, $fields['filters']);
				
				$documentation = NULL;
				$documentation_parts = array();
				
				
				$documentation_parts[] = new XMLElement('h3', 'Success and Failure XML Examples');			
				$documentation_parts[] = new XMLElement('p', 'When saved successfully, the following XML will be returned:');
			
				if($multiple){
					$code = new XMLElement($rootelement);
					$entry = new XMLElement('entry', NULL, array('index' => '0', 'result' => 'success' , 'type' => 'create | edit'));
					$entry->appendChild(new XMLElement('message', 'Entry [created | edited] successfully.'));	
					
					$code->appendChild($entry);				
				}
				
				else{
					$code = new XMLElement($rootelement, NULL, array('result' => 'success' , 'type' => 'create | edit'));
					$code->appendChild(new XMLElement('message', 'Entry [created | edited] successfully.'));
				}
				
				
				$documentation_parts[] = self::processDocumentationCode($code);
				
				###


				$documentation_parts[] = new XMLElement('p', 'When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned' . ($multiple ? ' (<b>Notice that it is possible to get mixtures of success and failure messages when using the "Allow Multiple" option</b>)' : NULL) . ':');

				if($multiple){
					$code = new XMLElement($rootelement);
					
					$entry = new XMLElement('entry', NULL, array('index' => '0', 'result' => 'error'));
					$entry->appendChild(new XMLElement('message', 'Entry encountered errors when saving.'));	
					$entry->appendChild(new XMLElement('field-name', NULL, array('type' => 'invalid | missing')));
					$code->appendChild($entry);	
					
					$entry = new XMLElement('entry', NULL, array('index' => '1', 'result' => 'success' , 'type' => 'create | edit'));
					$entry->appendChild(new XMLElement('message', 'Entry [created | edited] successfully.'));
					$code->appendChild($entry);								
				}
				
				else{
					$code = new XMLElement($rootelement, NULL, array('result' => 'error'));
					$code->appendChild(new XMLElement('message', 'Entry encountered errors when saving.'));
					$code->appendChild(new XMLElement('field-name', NULL, array('type' => 'invalid | missing')));
				}
				

				$code->setValue('...', false);
				$documentation_parts[] = self::processDocumentationCode($code);				

				###
				

				if(is_array($fields['filters']) && !empty($fields['filters'])){
					$documentation_parts[] = new XMLElement('p', 'The following is an example of what is returned if any filters fail:');

					$code = new XMLElement($rootelement, NULL, array('result' => 'error'));
					$code->appendChild(new XMLElement('message', 'Entry encountered errors when saving.'));
					$code->appendChild(new XMLElement('filter', NULL, array('name' => 'admin-only', 'status' => 'failed')));
					$code->appendChild(new XMLElement('filter', 'Recipient username was invalid', array('name' => 'send-email', 'status' => 'failed')));					
					$code->setValue('...', false);
					$documentation_parts[] = self::processDocumentationCode($code);		
				}
				
				###
				
				$documentation_parts[] = new XMLElement('h3', 'Example Front-end Form Markup');
				
				$documentation_parts[] = new XMLElement('p', 'This is an example of the form markup you can use on your frontend:');				
				$container = new XMLElement('form', NULL, array('method' => 'post', 'action' => '', 'enctype' => 'multipart/form-data'));
				$container->appendChild(Widget::Input('MAX_FILE_SIZE', $this->_Parent->Configuration->get('max_upload_size', 'admin'), 'hidden'));

				$sectionManager = new SectionManager($this->_Parent);
				$section = $sectionManager->fetch($fields['source']);
				$markup = NULL;
				foreach($section->fetchFields() as $f){
					$container->appendChild($f->getExampleFormMarkup());
				}
				$container->appendChild(Widget::Input('action['.$rootelement.']', 'Submit', 'submit'));
				
				$code = $container->generate(true);
				
				$documentation_parts[] = self::processDocumentationCode(($multiple ? str_replace('fields[', 'fields[0][', $code) : $code));
				
				
				$documentation_parts[] = new XMLElement('p', 'To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:');
				$documentation_parts[] = self::processDocumentationCode(Widget::Input('id' . ($multiple ? '[0]' : NULL), 23, 'hidden'));
				

				$documentation_parts[] = new XMLElement('p', 'To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:');
				$documentation_parts[] = self::processDocumentationCode(Widget::Input('redirect', URL.'/success/', 'hidden'));

				if(@in_array('send-email', $fields['filters'])){
					
					$documentation_parts[] = new XMLElement('h3', 'Send Email Filter');
					
					$documentation_parts[] = new XMLElement('p', 'The send email filter, upon the event successfully saving the entry, takes input from the form and send an email to the desired recipient. <b>This filter currently does not work with the "Allow Multiple" option.</b> The following are the recognised fields:');

					$documentation_parts[] = self::processDocumentationCode(
						'send-email[from]'.self::CRLF.
						'send-email[subject] // Optional'.self::CRLF.
						'send-email[body]'.self::CRLF.
						'send-email[recipient] // list of comma author usernames.');

					$documentation_parts[] = new XMLElement('p', 'All of these fields can be set dynamically using the exact field name of another field in the form as shown below in the example form:');	
									
			        $documentation_parts[] = self::processDocumentationCode('<form action="" method="post">
	<fieldset>
		<label>Name <input type="text" name="fields[author]" value="" /></label>
		<label>Email <input type="text" name="fields[email]" value="" /></label>
		<label>Message <textarea name="fields[message]" rows="5" cols="21"></textarea></label>
		<input name="send-email[from]" value="fields[email]" type="hidden" />
		<input name="send-email[subject]" value="You are being contacted" type="hidden" />
		<input name="send-email[body]" value="fields[message]" type="hidden" />
		<input name="send-email[recipient]" value="fred" type="hidden" />
		<input id="submit" type="submit" name="action[save-contact-form]" value="Send" />
	</fieldset>
</form>');		
					
				}
	
				###
				# Delegate: AppendEventFilterDocumentation
				# Description: Allows adding documentation for new filters. A reference to the $documentation array is provided, along with selected filters
				$this->_Parent->ExtensionManager->notifyMembers('AppendEventFilterDocumentation', '/blueprints/events/' . $this->_context[0] . '/', array('selected' => $fields['filters'], 'documentation' => &$documentation_parts));
				
				$documentation = join(self::CRLF, array_map(create_function('$x', 'return rtrim($x->generate(true, 4));'), $documentation_parts));
				$documentation = str_replace('\'', '\\\'', $documentation);
				
				$eventShell = str_replace('<!-- CLASS NAME -->', $classname, $eventShell);
				$eventShell = str_replace('<!-- SOURCE -->', $source, $eventShell);
				$eventShell = str_replace('<!-- DOCUMENTATION -->', General::tabsToSpaces($documentation, 2), $eventShell);
				$eventShell = str_replace('<!-- ROOT ELEMENT -->', $rootelement, $eventShell);
				
				## Remove left over placeholders
				$eventShell = preg_replace(array('/<!--[\w ]++-->/'), '', $eventShell);	

				##Write the file
				if(!is_writable(dirname($file)) || !$write = General::writeFile($file, $eventShell, $this->_Parent->Configuration->get('write_mode', 'file')))
					$this->pageAlert('Failed to write Event to <code>'.EVENTS.'</code>. Please check permissions.', AdministrationPage::PAGE_ALERT_ERROR);			

				##Write Successful, add record to the database
				else{
					
					if($queueForDeletion){ 
						General::deleteFile($queueForDeletion);
									
						$sql = "SELECT * FROM `tbl_pages` WHERE `events` REGEXP '[[:<:]]".$existing_handle."[[:>:]]' ";
						$pages = $this->_Parent->Database->fetch($sql);

						if(is_array($pages) && !empty($pages)){
							foreach($pages as $page){
								
								$page['events'] = preg_replace('/\b'.$existing_handle.'\b/i', $classname, $page['events']);
								
								$this->_Parent->Database->update($page, 'tbl_pages', "`id` = '".$page['id']."'");
							}
						}						
						
					}
					
					### TODO: Fix me
					###
					# Delegate: Create
					# Description: After saving the event, the file path is provided and an array 
					#              of variables set by the editor
					#$ExtensionManager->notifyMembers('Create', getCurrentPage(), array('file' => $file, 'defines' => $defines, 'var' => $var));

	                redirect(URL . '/symphony/blueprints/events/edit/'.$classname.'/'.($this->_context[0] == 'new' ? 'created' : 'saved') . '/');

				}
			}						
		}
		
		public static function processDocumentationCode($code){
			return new XMLElement('pre', '<code>' . str_replace('<', '&lt;', str_replace('&', '&amp;', trim((is_object($code) ? $code->generate(true) : $code)))) . '</code>', array('class' => 'XML'));
		}

		
		function __injectFilters(&$shell, $elements){
			if(!is_array($elements) || empty($elements)) return;
			
			$shell = str_replace('<!-- FILTERS -->',  "'" . implode("'," . self::CRLF . "\t\t\t\t'", $elements) . "'", $shell);
			
		}
		
		function __injectAboutInformation(&$shell, $details){
			if(!is_array($details) || empty($details)) return;
			
			foreach($details as $key => $val) $shell = str_replace('<!-- ' . strtoupper($key) . ' -->', addslashes($val), $shell);
		}
	}
	
?>