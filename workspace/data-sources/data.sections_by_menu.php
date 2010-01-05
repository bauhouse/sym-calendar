<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcesections_by_menu extends Datasource{
		
		var $dsParamROOTELEMENT = 'sections-by-menu';
		var $dsParamORDER = 'asc';
		var $dsParamLIMIT = '50';
		var $dsParamREDIRECTONEMPTY = 'no';
		var $dsParamREQUIREDPARAM = '$menu';
		var $dsParamSORT = 'sort';
		var $dsParamSTARTPAGE = '1';
		
		var $dsParamFILTERS = array(
				'9' => '{$ds-menu}',
				'18' => 'no',
		);
		
		var $dsParamINCLUDEDELEMENTS = array(
				'title',
				'url'
		);

		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-menu');
		}
		
		function about(){
			return array(
					 'name' => 'Sections by Menu',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://designadmin/system-navigation',
							'email' => 'stephen@bauhousedesign.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-28T13:43:56+00:00');	
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