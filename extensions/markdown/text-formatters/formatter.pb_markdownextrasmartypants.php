<?php

	Class formatterpb_markdownextrasmartypants extends TextFormatter{
		
		function about(){
			return array(
						 'name' => 'Markdown Extra plus SmartyPants',
						 'version' => '1.3',
						 'release-date' => '2007-12-06',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'description' => 'Write entries in the Markdown Extra format. The final result is passed through SmartyPants. Wrapper for the PHP Markdown Extra and SmrtyPants text-to-HTML conversion tool written by Michel Fortin.'
				 		);
		}
				
		function run($string){
            if(!function_exists('Markdown')) include_once(EXTENSIONS . '/markdown/lib/markdown_extra.php');
            if(!function_exists('SmartyPants')) include_once(EXTENSIONS . '/markdown/lib/smartypants.php');
            
            $result = stripslashes(Markdown($string));
            return SmartyPants($result);
		}		
		
	}
	
?>