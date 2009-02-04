<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcemenus extends Datasource{
		
		var $dsParamROOTELEMENT = 'menus';
		var $dsParamORDER = 'asc';
		var $dsParamLIMIT = '20';
		var $dsParamREDIRECTONEMPTY = 'no';
		var $dsParamSORT = 'system:id';
		var $dsParamSTARTPAGE = '1';
		
		var $dsParamFILTERS = array(
				'17' => 'no',
		);
		
		var $dsParamINCLUDEDELEMENTS = array(
				'title',
				'description',
				'deleted'
		);

		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		function about(){
			return array(
					 'name' => 'Menus',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://192.168.0.144/testsites/designadmin/system-navigation',
							'email' => 'stephen@domain7.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-29T00:36:29+00:00');	
		}
		
		function getSource(){
			return '1';
		}
		
		function allowEditorToParse(){
			return true;
		}
		
		function grab(&$param_pool){
			$result = NULL;
				
			include(TOOLKIT . '/data-sources/datasource.section.php');
			
			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

?>