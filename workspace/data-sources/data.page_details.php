<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcepage_details extends Datasource{
		
		var $dsParamROOTELEMENT = 'page-details';
		var $dsParamORDER = 'desc';
		var $dsParamLIMIT = '20';
		var $dsParamREDIRECTONEMPTY = 'no';
		var $dsParamREQUIREDPARAM = '$entry';
		var $dsParamPARAMOUTPUT = 'system:id';
		var $dsParamSORT = 'system:id';
		var $dsParamSTARTPAGE = '1';
		
		var $dsParamFILTERS = array(
				'id' => '{$id}',
				'10' => '{$entry}',
				'19' => 'no',
		);
		
		var $dsParamINCLUDEDELEMENTS = array(
				'title',
				'heading',
				'description',
				'body',
				'url',
				'sort',
				'section'
		);

		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		function about(){
			return array(
					 'name' => 'Page Details',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://designadmin/system-navigation',
							'email' => 'stephen@bauhousedesign.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-28T13:42:31+00:00');	
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