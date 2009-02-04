<?php

	Class formatterpb_markdownextra extends TextFormatter{
		
		function about(){
			return array(
						 'name' => 'Markdown Extra Text Formatter',
						 'version' => '1.3',
						 'release-date' => '2007-12-06',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'description' => 'Write entries in the Markdown Extra format. Wrapper for the PHP Markdown Extra text-to-HTML conversion tool written by Michel Fortin.'
				 		);
		}
				
		function run($string){
            if(!function_exists('Markdown')) include_once(EXTENSIONS . '/markdown/lib/markdown_extra.php');
			return stripslashes(Markdown($string));
		}		
		
	}
	
?>