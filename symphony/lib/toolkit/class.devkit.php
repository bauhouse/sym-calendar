<?php
	
	require_once(TOOLKIT . '/class.htmlpage.php');
	
	class DevKit extends HTMLPage {
		protected $_query_string = '';
		protected $_page = null;
		protected $_pagedata = null;
		protected $_xml = null;
		protected $_param = array();
		protected $_output = '';
		
		protected function appendHeader() {
			$this->addHeaderToPage('Content-Type', 'text/html; charset=UTF-8');
			
			$this->Html->setElementStyle('html');
			$this->Html->setDTD('<!DOCTYPE html>');
			$this->Html->setAttribute('lang', __LANG__);
			$this->addElementToHead(new XMLElement(
				'meta', null,
				array(
					'http-equiv'	=> 'Content-Type',
					'content'		=> 'text/html; charset=UTF-8'
				)
			));
			$this->addElementToHead(new XMLElement(
				'link', null,
				array(
					'rel'			=> 'icon',
					'href'			=> URL . '/symphony/assets/images/bookmark.png',
					'type'			=> 'image/png'
				)
			));
			$this->addStylesheetToHead(URL . '/symphony/assets/devkit.css', 'screen');
			
			$this->setTitle(__(
				'%1$s &ndash; %2$s &ndash; %3$s',
				array(
					__('Symphony'),
					__($this->_title),
					$this->_pagedata['title']
				)
			));
			
			$h1 = new XMLElement('h1');
			$h1->appendChild(Widget::Anchor(
				$this->_pagedata['title'], ($this->_query_string ? '?' . trim(html_entity_decode($this->_query_string), '&') : '.')
			));
			$this->Body->appendChild($h1);
		}
		
		protected function appendNavigation() {
			$xml = new DOMDocument();
			$xml->preserveWhiteSpace = false;
			$xml->formatOutput = true;
			$xml->load(ASSETS . '/devkit_navigation.xml');
			$root = $xml->documentElement;
			$first = $root->firstChild;
			$xpath = new DOMXPath($xml);
			$list = new XMLElement('ul');
			$list->setAttribute('id', 'nav');
			
			// Add edit link:
			$item = new XMLElement('li');
			$item->appendChild(Widget::Anchor(
				__('Edit'), URL . '/symphony/blueprints/pages/edit/' . $this->_pagedata['id'] . '/'
			));
			$list->appendChild($item);
			
			// Translate navigaton names:
			if ($root->hasChildNodes()) {
				foreach ($root->childNodes as $item) if ($item->tagName == 'item') {
					$item->setAttribute('name', __($item->getAttribute('name')));
				}
			}
			
			####
			# Delegate: ManipulateDevKitNavigation
			# Description: Allow navigation XML to be manipulated before it is rendered.
			# Global: Yes
			$this->_page->ExtensionManager->notifyMembers(
				'ManipulateDevKitNavigation', '/frontend/',
				array(
					'xml'	=> $xml
				)
			);
			
			if ($root->hasChildNodes()) {
				foreach ($root->childNodes as $node) {
					if ($node->getAttribute('active') == 'yes') {
						$item = new XMLElement('li', $node->getAttribute('name'));
						
					} else {
						$item = new XMLElement('li');
						$item->appendChild(Widget::Anchor(
							$node->getAttribute('name'),
							'?' . $node->getAttribute('handle') . $this->_query_string
						));
					}
					
					$list->appendChild($item);
				}
			}
			
			$this->Body->appendChild($list);
		}
		
		protected function appendJump() {
			
		}
		
		protected function appendContent() {
			$this->appendHeader();
			$this->appendNavigation();
		}
		
		protected function buildJumpItem($name, $link, $active = false) {
			$item = new XMLElement('li');
			$anchor = Widget::Anchor($name,  $link);
			$anchor->setAttribute('class', 'inactive');
			
			if ($active == true) {
				$anchor->setAttribute('class', 'active');
			}
			
			$item->appendChild($anchor);
			
			return $item;
		}
		
		public function prepare($page, $pagedata, $xml, $param, $output) {
			$this->_page = $page;
			$this->_pagedata = $pagedata;
			$this->_xml = $xml;
			$this->_param = $param;
			$this->_output = $output;
			
			if (is_null($this->_title)) {
				$this->_title = __('Utility');
			}
		}
		
		public function generate() {
			$this->appendContent();
			
			return parent::generate();
		}
	}
	
?>