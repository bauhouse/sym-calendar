<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcesite_sections extends Datasource{
		
		public $dsParamROOTELEMENT = 'site-sections';
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Site Sections',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://home/sym/sym-calendar-207',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-03-01T15:29:57+00:00');	
		}
		
		public function getSource(){
			return 'static_xml';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				$result = "<site-sections>
		  <section branch=\"parent\">
		    <title lowercase=\"menus\" handle=\"menus\">Menus</title>
		    <type lowercase=\"menu\" handle=\"menu\">Menu</type>
		    <form method=\"post\" action=\"\" enctype=\"multipart/form-data\">
		      <input name=\"MAX_FILE_SIZE\" type=\"hidden\" value=\"5242880\" />
		      <label class=\"show\">Title
		        <input name=\"fields[title]\" type=\"text\" />
		      </label>
		      <label class=\"show\">Description
		        <textarea name=\"fields[description]\" rows=\"15\" cols=\"50\"></textarea>
		      </label>
		      <label>Deleted
		        <input name=\"fields[deleted]\" type=\"checkbox\" />
		      </label>
		      <input name=\"action[publish-menu]\" type=\"submit\" value=\"Submit\" />
		    </form>
		  </section>
		  <section branch=\"self\">
		    <title lowercase=\"sections\" handle=\"sections\">Sections</title>
		    <type lowercase=\"section\" handle=\"section\">Section</type>
		    <form method=\"post\" action=\"\" enctype=\"multipart/form-data\">
		      <input name=\"MAX_FILE_SIZE\" type=\"hidden\" value=\"5242880\" />
		      <label class=\"show\">Title
		        <input name=\"fields[title]\" type=\"text\" />
		      </label>
		      <label class=\"show\">Menu
		        <select name=\"fields[menu]\" class=\"section-link\"/>
		      </label>
		      <label class=\"show\">URL
		        <input name=\"fields[url]\" type=\"text\" />
		      </label>
		      <label class=\"show\">Sort
		        <input name=\"fields[sort]\" type=\"text\" />
		      </label>
		      <label>Heading
		        <input name=\"fields[heading]\" type=\"text\" />
		      </label>
		      <label>Description
		        <textarea name=\"fields[description]\" rows=\"8\" cols=\"50\"></textarea>
		      </label>
		      <label>Body
		        <textarea name=\"fields[body]\" rows=\"16\" cols=\"50\"></textarea>
		      </label>
		      <label>Deleted
		        <input name=\"fields[deleted]\" type=\"checkbox\" />
		      </label>
		      <input name=\"action[publish-section]\" type=\"submit\" value=\"Submit\" />
		    </form>
		  </section>
		  <section branch=\"child\">
		    <title lowercase=\"pages\" handle=\"pages\">Pages</title>
		    <type lowercase=\"page\" handle=\"page\">Page</type>
		    <form method=\"post\" action=\"\" enctype=\"multipart/form-data\">
		      <input name=\"MAX_FILE_SIZE\" type=\"hidden\" value=\"5242880\" />
		      <label class=\"show\">Title
		        <input name=\"fields[title]\" type=\"text\" />
		      </label>
		      <label class=\"show\">Section
		        <select name=\"fields[section]\" class=\"section-link\"/>
		      </label>
		      <label class=\"show\">URL
		        <input name=\"fields[url]\" type=\"text\" />
		      </label>
		      <label class=\"show\">Sort
		        <input name=\"fields[sort]\" type=\"text\" />
		      </label>
		      <label>Heading
		        <input name=\"fields[heading]\" type=\"text\" />
		      </label>
		      <label>Description
		        <textarea name=\"fields[description]\" rows=\"8\" cols=\"50\"></textarea>
		      </label>
		      <label>Body
		        <textarea name=\"fields[body]\" rows=\"16\" cols=\"50\"></textarea>
		      </label>
		      <label>Deleted
		        <input name=\"fields[deleted]\" type=\"checkbox\" />
		      </label>
		      <input name=\"action[publish-page]\" type=\"submit\" value=\"Submit\" />
		    </form>
		  </section>
		</site-sections>";
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}			
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

