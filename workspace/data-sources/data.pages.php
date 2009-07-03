<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcepages extends Datasource{
		
		var $dsParamROOTELEMENT = 'pages';
		var $dsParamORDER = 'asc';
		var $dsParamGROUP = '16';
		var $dsParamLIMIT = '50';
		var $dsParamREDIRECTONEMPTY = 'no';
		var $dsParamSORT = 'sort';
		var $dsParamSTARTPAGE = '1';
		
		var $dsParamFILTERS = array(
				'19' => 'no',
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
					 'name' => 'Pages',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://192.168.0.144/testsites/designadmin/system-navigation',
							'email' => 'stephen@domain7.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-29T02:09:32+00:00');	
		}
		
		function getSource(){
			return '3';
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