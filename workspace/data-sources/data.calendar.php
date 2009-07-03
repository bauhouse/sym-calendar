<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcecalendar extends Datasource{
		
		var $dsParamROOTELEMENT = 'calendar';
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		function about(){
			return array(
					 'name' => 'Calendar',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://designadmin/calendar',
							'email' => 'stephen@bauhousedesign.com'),
					 'version' => '1.0',
					 'release-date' => '2008-04-10T14:29:16+00:00');	
		}
		
		function getSource(){
			return 'static_xml';
		}
		
		function allowEditorToParse(){
			return true;
		}
		
		function grab(&$param_pool){
			$result = NULL;
				
			$xml = <<<XML
	<calendar>
	  <year>
	    <month value="1" days="31">January</month>
	    <month value="2" days="28" leap-year-days="29">February</month>
	    <month value="3" days="31">March</month>
	    <month value="4" days="30">April</month>
	    <month value="5" days="31">May</month>
	    <month value="6" days="30">June</month>
	    <month value="7" days="31">July</month>
	    <month value="8" days="31">August</month>
	    <month value="9" days="30">September</month>
	    <month value="10" days="31">October</month>
	    <month value="11" days="30">November</month>
	    <month value="12" days="31">December</month>
	  </year>
	</calendar>
XML;
			$result = self::CRLF . '	' . trim($xml) . self::CRLF;
			
			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

?>