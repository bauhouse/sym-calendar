<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcepages_by_section extends Datasource{
		
		var $dsParamROOTELEMENT = 'pages-by-section';
		var $dsParamORDER = 'asc';
		var $dsParamLIMIT = '50';
		var $dsParamREDIRECTONEMPTY = 'no';
		var $dsParamREQUIREDPARAM = '$section';
		var $dsParamSORT = 'sort';
		var $dsParamSTARTPAGE = '1';
		
		var $dsParamFILTERS = array(
				'16' => '{$ds-section}',
				'19' => 'no',
		);
		
		var $dsParamINCLUDEDELEMENTS = array(
				'title',
				'url'
		);

		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-section');
		}
		
		function about(){
			return array(
					 'name' => 'Pages by Section',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://designadmin/system-navigation',
							'email' => 'stephen@bauhousedesign.com'),
					 'version' => '1.0',
					 'release-date' => '2008-03-28T13:42:57+00:00');	
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