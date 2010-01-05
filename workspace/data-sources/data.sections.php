<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcesections extends Datasource{
		
		var $dsParamROOTELEMENT = 'sections';
		var $dsParamORDER = 'asc';
		var $dsParamGROUP = '9';
		var $dsParamLIMIT = '20';
		var $dsParamREDIRECTONEMPTY = 'no';
		var $dsParamSORT = 'sort';
		var $dsParamSTARTPAGE = '1';
		
		var $dsParamFILTERS = array(
				'18' => 'no',
		);
		
		var $dsParamINCLUDEDELEMENTS = array(
				'title',
				'url',
				'sort'
		);

		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		function about(){
			return array(
					 'name' => 'Sections',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://192.168.0.144/testsites/designadmin/system-navigation',
							'email' => 'stephen@domain7.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-29T01:27:58+00:00');	
		}
		
		function getSource(){
			return '2';
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