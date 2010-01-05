<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcesection extends Datasource{
		
		var $dsParamROOTELEMENT = 'section';
		var $dsParamORDER = 'desc';
		var $dsParamLIMIT = '1';
		var $dsParamREDIRECTONEMPTY = 'no';
		var $dsParamREQUIREDPARAM = '$section';
		var $dsParamPARAMOUTPUT = 'system:id';
		var $dsParamSORT = 'system:id';
		var $dsParamSTARTPAGE = '1';
		
		var $dsParamFILTERS = array(
				'3' => '{$section}',
				'9' => '{$ds-menu}',
				'18' => 'no',
		);
		
		var $dsParamINCLUDEDELEMENTS = array(
				'title'
		);

		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-menu');
		}
		
		function about(){
			return array(
					 'name' => 'Section',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://designadmin/system-navigation',
							'email' => 'stephen@bauhousedesign.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-28T13:43:14+00:00');	
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