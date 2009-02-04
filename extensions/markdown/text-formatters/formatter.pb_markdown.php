<?php

	Class formatterpb_markdown extends TextFormatter{
		
		function about(){
			return array(
						 'name' => 'Markdown Text Formatter',
						 'version' => '1.5',
						 'release-date' => '2007-12-06',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'description' => 'Write entries in the Markdown format. Wrapper for the PHP Markdown text-to-HTML conversion tool written by Michel Fortin.'
				 		);
		}
				
		function run($string){
		    if(!function_exists('Markdown')) include_once(EXTENSIONS . '/markdown/lib/markdown.php');
			return stripslashes(Markdown($string));
		}		
		
	}

?>