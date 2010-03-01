<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcepages_by_section extends Datasource{
		
		public $dsParamROOTELEMENT = 'pages-by-section';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '50';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$section';
		public $dsParamSORT = 'sort';
		public $dsParamSTARTPAGE = '1';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';
		
		public $dsParamFILTERS = array(
				'19' => 'no',
				'20' => '{$ds-section}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'url'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-section');
		}
		
		public function about(){
			return array(
					 'name' => 'Pages by Section',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://home/sym/sym-calendar-207',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2010-03-01T15:25:12+00:00');	
		}
		
		public function getSource(){
			return '3';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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

