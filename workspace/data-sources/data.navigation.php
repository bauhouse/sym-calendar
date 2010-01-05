<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcenavigation extends Datasource{
		
		var $dsParamROOTELEMENT = 'navigation';
		var $dsParamORDER = 'desc';
		var $dsParamREDIRECTONEMPTY = 'no';
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		function about(){
			return array(
					 'name' => 'Navigation',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://designadmin/beta',
							'email' => 'stephen@bauhousedesign.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-21T23:38:38+00:00');	
		}
		
		function getSource(){
			return 'navigation';
		}
		
		function allowEditorToParse(){
			return true;
		}
		
		function grab(&$param_pool){
			$result = NULL;
				
			include(TOOLKIT . '/data-sources/datasource.navigation.php');
			
			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

?>