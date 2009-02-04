<?php

	include_once(TOOLKIT . '/class.manager.php');
	include_once(TOOLKIT . '/class.extension.php');
	
	define_safe('EXTENSION_ENABLED', 10);
	define_safe('EXTENSION_DISABLED', 11);
	define_safe('EXTENSION_NOT_INSTALLED', 12);	
	define_safe('EXTENSION_REQUIRES_UPDATE', 13);	
	
    Class ExtensionManager extends Manager{
        
        function __getClassName($name){
	        return 'extension_' . $name;
        }
        
        function __getClassPath($name){
	        return EXTENSIONS . strtolower("/$name");
        }
        
        function __getDriverPath($name){
	        return $this->__getClassPath($name) . '/extension.driver.php';
        }       
        
        function getClassPath($name){
	        return EXTENSIONS . strtolower("/$name");
        }

		function sortByStatus($s1, $s2){
			
			if($s1['status'] == EXTENSION_ENABLED) $status_s1 = 2;
			elseif(in_array($s1['status'], array(EXTENSION_DISABLED, EXTENSION_NOT_INSTALLED, EXTENSION_REQUIRES_UPDATE))) $status_s1 = 1;
			else $status_s1 = 0;
			
			if($s2['status'] == EXTENSION_ENABLED) $status_s2 = 2;
			elseif(in_array($s2['status'], array(EXTENSION_DISABLED, EXTENSION_NOT_INSTALLED, EXTENSION_REQUIRES_UPDATE))) $status_s2 = 1;			
			else $status_s2 = 0;	
			
			return $status_s2 - $status_s1;		
		}
 
		/*function update($name){

			$id = $this->registerService($name, false);
			
			## Run the update() function of the service
			if(false != ($obj =& $this->create($name))){
				$obj->update();
				unset($obj);
			}
			
			return $this->pruneService($name, true);			
		}*/
 
		/*function install($name){
			
			$id = $this->registerService($name);

			## Run the install() function of the service
			if(false != ($obj =& $this->create($name))){
				$obj->install();
				unset($obj);
			}					
		}*/
      
		function enable($name){
					
			if(false == ($obj =& $this->create($name))){
				trigger_error('Could not enable '.$name.', there was a problem loading the object. Check the driver class exists.', E_USER_WARNING);
				return false;
			}
				
			## If not installed, install it
			if($this->__requiresInstallation($name) && !$obj->install()){
				return false;
			}
			
			## If requires and upate before enabling, than update it first
			elseif($about = $this->about($name) && $this->__requiresUpdate($about)) $obj->update();
			
			$id = $this->registerService($name);
			
			## Now enable the extension
			$obj->enable();
			
			unset($obj);
						
			return true;
						
		}

		function disable($name){
			
			if(false == ($obj =& $this->create($name))){
				trigger_error('Could not disable '.$name.', there was a problem loading the object. Check the driver class exists.', E_USER_WARNING);
				return false;
			}

			$id = $this->registerService($name, false);
			
			$obj->disable();
			unset($obj);
				
			$this->pruneService($name, true);
						
			return true;			
		}

		function uninstall($name){
			
			if(false == ($obj =& $this->create($name))){
				trigger_error('Could not disable '.$name.', there was a problem loading the object. Check the driver class exists.', E_USER_WARNING);
				return false;
			}
			
			$obj->uninstall();
			unset($obj);
						
			$this->pruneService($name);		
			
			return true;	
		}
		
		function fetchStatus($name){
			if(!$status = $this->_Parent->Database->fetchVar('status', 0, "SELECT `status` FROM `tbl_extensions` WHERE `name` = '$name' LIMIT 1")) return EXTENSION_NOT_INSTALLED;
			
			if($status == 'enabled') return EXTENSION_ENABLED;
			
			return EXTENSION_DISABLED;

		}
		
		function pruneService($name, $delegates_only=false){

	        $classname = $this->__getClassName($name);   
	        $path = $this->__getDriverPath($name);

			if(!@file_exists($path)) return false;
			
			$delegates = $this->_Parent->Database->fetchCol('id', "SELECT tbl_extensions_delegates.`id` FROM `tbl_extensions_delegates` 
											 LEFT JOIN `tbl_extensions` ON (`tbl_extensions`.id = `tbl_extensions_delegates`.extension_id) 
											 WHERE `tbl_extensions`.name = '$name'");
			$this->_Parent->Database->delete('tbl_extensions_delegates', " `id` IN ('".@implode("', '", $delegates)."') ");
											
			if(!$delegates_only) $this->_Parent->Database->query("DELETE FROM `tbl_extensions` WHERE `name` = '$name'");

			## Remove the unused DB records
			$this->__cleanupDatabase();
			
			return true;					
		}
		
		function registerService($name, $enable=true){

	        $classname = $this->__getClassName($name);   
	        $path = $this->__getDriverPath($name);

			if(!@file_exists($path)) return false;

			require_once($path);
			
			$subscribed = call_user_func(array(&$classname, "getSubscribedDelegates"));
			
			if($existing_id = $this->fetchExtensionID($name))
				$this->_Parent->Database->query("DELETE FROM `tbl_extensions_delegates` WHERE `tbl_extensions_delegates`.extension_id = $existing_id");

			$this->_Parent->Database->query("DELETE FROM `tbl_extensions` WHERE `name` = '$name'");				

			$info = $this->about($name);
			
			$sql = "INSERT INTO `tbl_extensions` 
					VALUES (NULL, '$name', '".($enable ? 'enabled' : 'disabled')."', ".floatval($info['version']).")";
			
			$this->_Parent->Database->query($sql);	
			
			$id = $this->_Parent->Database->getInsertID();
						
			if(is_array($subscribed) && !empty($subscribed)){
				foreach($subscribed as $s){
					
					$sql = "INSERT INTO `tbl_extensions_delegates` 
							VALUES (NULL, '$id', '".$s['page']."', '".$s['delegate']."', '".$s['callback']."')";
							
					$this->_Parent->Database->query($sql);
					
				}
			}

			## Remove the unused DB records
			$this->__cleanupDatabase();
			
			return $id;
		}

		function listInstalledHandles(){
			return $this->_Parent->Database->fetchCol('name', "SELECT `name` FROM `tbl_extensions` WHERE `status` = 'enabled'");
		}

        ## Will return a list of all extensions and their about information
        function listAll(){
	        
			$extensions = array();
			$result = array();
	        $structure = General::listStructure(EXTENSIONS, array(), false, 'asc', EXTENSIONS);
	
	        $extensions = $structure['dirlist'];

	        if(is_array($extensions) && !empty($extensions)){
		        foreach($extensions as $e){	        
					if($about = $this->about($e)) $result[$e] = $about;							        
		        }
	        }

			return $result;
        }
        
        function notifyMembers($delegate, $page, $context=array()){

	        if($this->_Parent->Configuration->get('allow_page_subscription', 'symphony') != '1') return;
	        
			$services = $this->_Parent->Database->fetch("SELECT t1.*, t2.callback FROM `tbl_extensions` as t1 
											LEFT JOIN `tbl_extensions_delegates` as t2 ON t1.id = t2.extension_id
											WHERE (t2.page = '$page' OR t2.page = '*')
											AND t2.delegate = '$delegate'
											AND t1.status = 'enabled'");							
			
			if(!is_array($services) || empty($services)) return NULL;
	
	        $context += array('parent' => &$this->_Parent, 'page' => $page, 'delegate' => $delegate);
			
			foreach($services as $s){

				if(false != ($obj =& $this->create($s['name']))){

					if(is_callable(array($obj, $s['callback']))){
						$obj->{$s['callback']}($context);
						unset($obj);
					}				
				}	
								
			}
		  	
        }
        
        ## Creates a new object and returns a pointer to it
        function &create($name, $param=array(), $slient=false){
	        
	        $classname = $this->__getClassName($name);	        
	        $path = $this->__getDriverPath($name);
	        
	        if(!@is_file($path)){
		        if(!$slient) trigger_error("Could not find extension at location '$path'", E_USER_ERROR);	        	
		        return false;
	        }
	        
			if(!class_exists($classname)) require_once($path);
			
			if(!is_array($param)) $param = array();	
				
			if(!isset($param['parent'])) $param['parent'] =& $this->_Parent;	
			
			##Create the object
			$this->_pool[] =& new $classname($param);	
								
			return end($this->_pool);
	        
        }

  		/*function __hasUpdateMethod($classname){
			if(!class_exists($classname)) return false;
			
			$methods = get_class_methods($classname);

			return (@in_array('update', $methods) ? true : false);
			
		}*/
		     
		/*function __hasUninstallMethod($classname){
			if(!class_exists($classname)) return false;
			
			$methods = get_class_methods($classname);

			return (@in_array('uninstall', $methods) ? true : false);
			
		}*/

		function __requiresUpdate($info){

			if($info['status'] == EXTENSION_NOT_INSTALLED) return false;
			
			if($version = $this->fetchInstalledVersion($info['handle'])) return $version < floatval($info['version']);
				
			return false;
			
		}
		
		function __requiresInstallation($name){	
			$id = $this->_Parent->Database->fetchVar('id', 0, "SELECT `id` FROM `tbl_extensions` WHERE `name` = '$name' LIMIT 1");
			return (is_numeric($id) ? false : true);
		}
		
		
		function fetchInstalledVersion($name){
			$version = $this->_Parent->Database->fetchVar('version', 0, "SELECT `version` FROM `tbl_extensions` WHERE `name` = '$name' LIMIT 1");		
			return ($version ? floatval($version) : NULL);
		}
		
		function fetchExtensionID($name){
			return $this->_Parent->Database->fetchVar('id', 0, "SELECT `id` FROM `tbl_extensions` WHERE `name` = '$name' LIMIT 1");
		}
		
		function fetchCustomMenu($name){
			
		    $classname = $this->__getClassName($name); 	
				
			if(!class_exists($classname)){
  
		        $path = $this->__getDriverPath($name);

				if(!@file_exists($path)) return false;

				require_once($path);				
			}
			
			return @call_user_func(array(&$classname, 'fetchCustomMenu'));		
		}
		
		function __hasCustomInterface($name){
			return (@is_file($this->__getClassPath($name) . '/interface/content.index.php') ? 1 : 0);
		}
		
        ## Returns the about details of a service
        function about($name){
	
	        $classname = $this->__getClassName($name);   
	        $path = $this->__getDriverPath($name);

			if(!@file_exists($path)) return false;

			require_once($path);	
			        
	        if($about = @call_user_func(array(&$classname, "about"))){
				
				$about['handle'] = $name;
				$about['status'] = $this->fetchStatus($name);
				$about['panel'] = $this->__hasCustomInterface($name);				
				//$about['has-uninstall-method'] = $this->__hasUninstallMethod($classname);
				//$about['has-update-method'] = $this->__hasUpdateMethod($classname);
				//$about['has-custom-menu'] = @call_user_func(array(&$classname, 'hasCustomMenu'));				
				//$about['menu-group-position'] = @call_user_func(array(&$classname, 'fetchCustomMenuPosition'));
				
				$nav = @call_user_func(array(&$classname, 'fetchNavigation'));
				
				if($nav != NULL) $about['navigation'] = $nav;
				
				if($this->__requiresUpdate($about)) $about['status'] = EXTENSION_REQUIRES_UPDATE;

				return $about;
			}

			return false;
									        
        }

		function __cleanupDatabase(){
			
			## Grab any extensions sitting in the database
			$rows = $this->_Parent->Database->fetch("SELECT * FROM `tbl_extensions`");
			
			## Iterate over each row
			if(is_array($rows) && !empty($rows)){
				foreach($rows as $r){
					$name = $r['name'];
					
					## Grab the install location
					$path = $this->__getClassPath($name);
					
					## If it doesnt exist, remove the DB rows
					if(!@is_dir($path)){

						if($existing_id = $this->fetchExtensionID($name))
							$this->_Parent->Database->query("DELETE FROM `tbl_extensions_delegates` WHERE `tbl_extensions_delegates`.extension_id = $existing_id");

						$this->_Parent->Database->query("DELETE FROM `tbl_extensions` WHERE `name` = '$name' LIMIT 1");
		
					}
				}
			}
			
			## Remove old delegate information
			$disabled = $this->_Parent->Database->fetchCol('id', "SELECT `id` FROM `tbl_extensions` WHERE `status` = 'disabled'");
			$sql = "DELETE FROM `tbl_extensions_delegates` WHERE `extension_id` IN ('".@implode("', '", $disabled)."')";
			$this->_Parent->Database->query($sql);			
			
		}
    
    }
