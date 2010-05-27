
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `allow_author_change` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `allow_multiple_selection` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_author` ***

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (5, 17, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (9, 18, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (8, 19, 'off', NULL);

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `pre_populate` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_date` ***

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `validator` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (28, 1, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (38, 3, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (39, 4, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (40, 5, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (35, 10, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (36, 11, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (37, 14, NULL);

-- *** STRUCTURE: `tbl_fields_number` ***
DROP TABLE IF EXISTS `tbl_fields_number`;
CREATE TABLE `tbl_fields_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_number` ***

-- *** STRUCTURE: `tbl_fields_sectionlink` ***
DROP TABLE IF EXISTS `tbl_fields_sectionlink`;
CREATE TABLE `tbl_fields_sectionlink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `section_association_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_sectionlink` ***

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `allow_multiple_selection` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_select` ***

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`) VALUES (1, 20, 'no', 3, 20);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`) VALUES (2, 21, 'no', 1, 20);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `validator` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_taglist` ***

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `formatter` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (22, 2, 'pb_markdownextrasmartypants', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (29, 6, 'pb_markdownextrasmartypants', 8);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (30, 7, 'pb_markdownextrasmartypants', 16);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (27, 12, 'pb_markdownextrasmartypants', 8);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (28, 13, 'pb_markdownextrasmartypants', 16);

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `validator` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_upload` ***

-- *** STRUCTURE: `tbl_entries_data_1` ***
DROP TABLE IF EXISTS `tbl_entries_data_1`;
CREATE TABLE `tbl_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_1` ***
INSERT INTO `tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (177, 1, 'symphony', 'Symphony');
INSERT INTO `tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (178, 2, 'developer', 'Developer');
INSERT INTO `tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (179, 36, 'public', 'Public');
INSERT INTO `tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (180, 37, 'admin', 'Admin');
INSERT INTO `tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (176, 38, 'members', 'Members');

-- *** STRUCTURE: `tbl_entries_data_10` ***
DROP TABLE IF EXISTS `tbl_entries_data_10`;
CREATE TABLE `tbl_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_10` ***
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (358, 10, 'menus', 'Menus');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (366, 11, 'sections', 'Sections');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (359, 12, 'pages', 'Pages');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (360, 13, 'pages', 'Pages');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (349, 14, 'components', 'Components');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (367, 15, 'sections', 'Sections');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (344, 16, 'authors', 'Authors');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (365, 17, 'preferences', 'Preferences');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (350, 18, 'extensions', 'Extensions');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (361, 19, 'parameters', 'Parameters');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (363, 20, 'xml', 'XML');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (364, 21, 'xsl', 'XSL');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (362, 22, 'result', 'Result');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (348, 23, 'general-details', 'General Details');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (345, 24, 'data-source-execution', 'Data Source Execution');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (346, 25, 'event-execution', 'Event Execution');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (347, 26, 'full-page-render-statistics', 'Full Page Render Statistics');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (370, 27, 'symphony', 'Symphony');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (355, 28, 'overture-forum', 'Overture Forum');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (352, 31, 'issues', 'Issues');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (373, 32, 'home', 'Home');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (357, 33, 'login', 'Login');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (369, 34, 'site', 'Site');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (368, 35, 'system', 'System');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (353, 40, 'markdown-syntax', 'Markdown Syntax');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (354, 29, 'overture-extensions', 'Overture Extensions');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (351, 30, 'github-repository', 'Github Repository');

-- *** STRUCTURE: `tbl_entries_data_11` ***
DROP TABLE IF EXISTS `tbl_entries_data_11`;
CREATE TABLE `tbl_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_11` ***
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (98, 33, 'login-status', 'Login Status');
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (100, 34, 'site-administration', 'Site Administration');
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (99, 35, 'system-administration', 'System Administration');
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (103, 32, 'calendar-05', 'Calendar 0.5');

-- *** STRUCTURE: `tbl_entries_data_12` ***
DROP TABLE IF EXISTS `tbl_entries_data_12`;
CREATE TABLE `tbl_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_12` ***
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (358, 10, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (366, 11, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (359, 12, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (360, 13, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (349, 14, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (367, 15, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (344, 16, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (365, 17, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (350, 18, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (361, 19, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (363, 20, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (364, 21, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (362, 22, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (348, 23, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (345, 24, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (346, 25, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (347, 26, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (370, 27, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (355, 28, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (354, 29, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (351, 30, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (352, 31, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (357, 33, 'You will need to login to access the administration area. Please provide your username and password below.', '<p>You will need to login to access the administration area. Please provide your username and password below.</p>\n');
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (369, 34, 'An area where I can have a list of favourite sites, tools, etc.', '<p>An area where I can have a list of favourite sites, tools, etc.</p>\n');
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (368, 35, 'This area is strictly for managing the backend of the site.', '<p>This area is strictly for managing the backend of the site.</p>\n');
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (353, 40, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (373, 32, '### A Symphony Ensemble\r\n\r\nVersion 0.5 | 1 Mar 2010\r\n\r\nThe Calendar Symphony Ensemble has been created specifically with the goal of managing dates and calendars. Keep in mind that this ensemble is in an experimental state. Hopefully, it will provide a starting point on which to build your own ideas. To view the application, you will need to [log in](/login/).\r\n\r\nDeveloped by Stephen Bau, [MGDC](http://www.gdc.net/join/member/articles103.php), Lead Designer, [Domain7 Solutions Inc](http://www.domain7.com/)\r\n\r\n### Notes\r\n\r\n* The calendar application includes [year](/calendar/year/), [month](/calendar/), [week](/calendar/week/) and [day](/calendar/day/) views.\r\n* Consult the [Symphony CMS Forum](http://symphony-cms.com/forum/discussions/201/) for more information\r\n\r\n### Change Log\r\n\r\n* Version 0.5 - 1 Mar 2010 - Updated Ensemble to Symphony 2.0.7\r\n* Version 0.4 - 22 Feb 2010 - Updated Ensemble to Symphony 2.0.6\r\n* Version 0.3 - 4 July 2009 - Updated Ensemble to Symphony 2.0.3\r\n* Version 0.2 - 21 December 2008 - Updated Ensemble to Symphony 2.0\r\n* Version 0.1 - 11 April 2008 - Symphony 2 Beta Revision 5\r\n', '<h3>A Symphony Ensemble</h3>\n\n<p>Version 0.5 | 1 Mar 2010</p>\n\n<p>The Calendar Symphony Ensemble has been created specifically with the goal of managing dates and calendars. Keep in mind that this ensemble is in an experimental state. Hopefully, it will provide a starting point on which to build your own ideas. To view the application, you will need to <a href=\"/login/\">log in</a>.</p>\n\n<p>Developed by Stephen Bau, <a href=\"http://www.gdc.net/join/member/articles103.php\">MGDC</a>, Lead Designer, <a href=\"http://www.domain7.com/\">Domain7 Solutions Inc</a></p>\n\n<h3>Notes</h3>\n\n<ul>\n<li>The calendar application includes <a href=\"/calendar/year/\">year</a>, <a href=\"/calendar/\">month</a>, <a href=\"/calendar/week/\">week</a> and <a href=\"/calendar/day/\">day</a> views.</li>\n<li>Consult the <a href=\"http://symphony-cms.com/forum/discussions/201/\">Symphony CMS Forum</a> for more information</li>\n</ul>\n\n<h3>Change Log</h3>\n\n<ul>\n<li>Version 0.5 - 1 Mar 2010 - Updated Ensemble to Symphony 2.0.7</li>\n<li>Version 0.4 - 22 Feb 2010 - Updated Ensemble to Symphony 2.0.6</li>\n<li>Version 0.3 - 4 July 2009 - Updated Ensemble to Symphony 2.0.3</li>\n<li>Version 0.2 - 21 December 2008 - Updated Ensemble to Symphony 2.0</li>\n<li>Version 0.1 - 11 April 2008 - Symphony 2 Beta Revision 5</li>\n</ul>\n');

-- *** STRUCTURE: `tbl_entries_data_13` ***
DROP TABLE IF EXISTS `tbl_entries_data_13`;
CREATE TABLE `tbl_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_13` ***
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (358, 10, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (366, 11, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (359, 12, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (360, 13, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (349, 14, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (367, 15, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (344, 16, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (365, 17, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (350, 18, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (361, 19, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (363, 20, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (364, 21, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (362, 22, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (348, 23, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (345, 24, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (346, 25, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (347, 26, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (370, 27, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (355, 28, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (354, 29, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (351, 30, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (352, 31, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (357, 33, 'To find out more about this Symphony Ensemble, read more about the features in this version on the home page. An extended entry is shown on the [home page](/) when you log in.', '<p>To find out more about this Symphony Ensemble, read more about the features in this version on the home page. An extended entry is shown on the <a href=\"/\">home page</a> when you log in.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (369, 34, 'It can have a list of sites that I am currently working on, a list of commonly used resources, and a list of things to do.', '<p>It can have a list of sites that I am currently working on, a list of commonly used resources, and a list of things to do.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (368, 35, 'This would involve the mechanics of building the site in Symphony. All of these items can be hidden from the general users of the site.', '<p>This would involve the mechanics of building the site in Symphony. All of these items can be hidden from the general users of the site.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (373, 32, '### Symphony 2.0\r\n\r\nThis is an experiment to build an application with [Symphony](http://symphony-cms.com/). You’ll notice that once you are logged in, you have access to a number of additional features. Most notable is the system navigation bar at the top of the page that is only visible to users that are logged in to custom admin pages. This feature is not available to the Symphony core pages that you can find in the [Symphony admin area](/symphony/).\r\n\r\nTo switch this feature off, you can edit the [system-navigation.xsl](/symphony/blueprints/utilities/edit/system-navigation/) utility. The `system-navigation` template has a parameter called `system-navigation-switch` which you can give any value other than `\'on\'` to turn this feature off.\r\n\r\nYou’ll also notice that there are three admin areas: [Site](/site/), [System](/system/) and [Symphony](/symphony/).\r\n\r\nThere are also three sections in the Publish menu: [Menus](/symphony/publish/menus/), [Sections](/symphony/publish/sections/) and [Pages](/symphony/publish/pages/).\r\n\r\nAlso, note that I am using [Markdown](http://daringfireball.net/projects/markdown/) to format my entries, but I am also using Allen Chang’s [typography.xsl](http://symphony-cms.com/forum/discussions/152/) file with some slight additions to ensure that the URLs that I am using here will always point to the right place, regardless of whether this site is published at the root of a domain or deep in a subdirectory. Just be sure to format all internal links with a leading slash for all links relative to the root of this install of Symphony.\r\n\r\n### Powered by XML\r\n\r\nInformation is stored in a MySQL database and can be easily edited through the [Symphony administration interface](/symphony/). The interface is extremely customizable, allowing the creation of several types of [custom fields](/symphony/blueprints/sections/edit/3/) that can be organized into [Sections](/symphony/blueprints/sections/) that appear under the [Publish](/symphony/) menu. You can see by editing [this entry](/symphony/publish/pages/edit/32/), found in the [Pages](/symphony/publish/pages/) Section.\r\n\r\nThe [XML data source](/symphony/blueprints/datasources/edit/page_details/) for the page content is configured with the Data Source Editor, found under the [Blueprints : Components](/symphony/blueprints/components/) menu. The data source is then attached to the [page template](/symphony/blueprints/pages/edit/1/) (click on the “Configure” button in the top right to view the data sources attached to a page). The data for this entry is converted into XML data to be transformed by XSL templates into HTML pages to be served to web browsers. To view the [XML data](?debug) for any front-end page, add   `?debug`   at the end of the URI of the page. Of course, this is only accessible to logged-in site administrators.\r\n\r\n### Powered by XSLT\r\n\r\nAll front-end pages are built with XSLT. You can find the page templates listed under the [Blueprints : Pages](/symphony/blueprints/pages/) menu. The [page template](/symphony/blueprints/pages/edit/1/) can be edited within the Symphony web interface, or you can use a FTP application to edit files directly on the server. The [master template](/symphony/blueprints/utilities/edit/public-master/) has been created as a utility that can be imported by page templates to control layout using XSL templates. Other templates can also be imported in this same way and can themselves import other templates.\r\n\r\n### Extensible and Customizable\r\n\r\nVery little is assumed by Symphony. The application has been stripped down to mere essentials in order to allow developers to customize the interface as they like. Even [Preferences](/symphony/system/preferences/) are [Extensions](/symphony/system/extensions/) that are installed and enabled as required by the needs of the users and developers.\r\n\r\nCustom [Events](/symphony/blueprints/components/) can be written in PHP to provide additional functionality. Events are attached to page templates, enabling the ability for front-end forms. In this way, the core functionality of the system can be extended by building custom admin pages. The [Site Administration](/site/) system for this ensemble has been created to show the relationships between entries in linked sections. The ability to [copy entries](/site/pages/symphony/27/copy/) has been added by populating fields with data from other entries and saving this data as a new entry.\r\n\r\nFront end forms also allow for the ability to [edit multiple entries](/symphony/blueprints/events/edit/publish_pages/) at once. For example, all the menu items in the System Navigation bar can be edited by a single click by viewing a list of all the [Pages](/site/pages/) in the site, and clicking on the [Edit Pages](/site/pages/edit/) button at the bottom of the page. Entries can then be moved from one section to another through these custom admin pages, even though the core system does not provide this functionality with Section Links.', '<h3>Symphony 2.0</h3>\n\n<p>This is an experiment to build an application with <a href=\"http://symphony-cms.com/\">Symphony</a>. You’ll notice that once you are logged in, you have access to a number of additional features. Most notable is the system navigation bar at the top of the page that is only visible to users that are logged in to custom admin pages. This feature is not available to the Symphony core pages that you can find in the <a href=\"/symphony/\">Symphony admin area</a>.</p>\n\n<p>To switch this feature off, you can edit the <a href=\"/symphony/blueprints/utilities/edit/system-navigation/\">system-navigation.xsl</a> utility. The <code>system-navigation</code> template has a parameter called <code>system-navigation-switch</code> which you can give any value other than <code>\'on\'</code> to turn this feature off.</p>\n\n<p>You’ll also notice that there are three admin areas: <a href=\"/site/\">Site</a>, <a href=\"/system/\">System</a> and <a href=\"/symphony/\">Symphony</a>.</p>\n\n<p>There are also three sections in the Publish menu: <a href=\"/symphony/publish/menus/\">Menus</a>, <a href=\"/symphony/publish/sections/\">Sections</a> and <a href=\"/symphony/publish/pages/\">Pages</a>.</p>\n\n<p>Also, note that I am using <a href=\"http://daringfireball.net/projects/markdown/\">Markdown</a> to format my entries, but I am also using Allen Chang’s <a href=\"http://symphony-cms.com/forum/discussions/152/\">typography.xsl</a> file with some slight additions to ensure that the URLs that I am using here will always point to the right place, regardless of whether this site is published at the root of a domain or deep in a subdirectory. Just be sure to format all internal links with a leading slash for all links relative to the root of this install of Symphony.</p>\n\n<h3>Powered by XML</h3>\n\n<p>Information is stored in a MySQL database and can be easily edited through the <a href=\"/symphony/\">Symphony administration interface</a>. The interface is extremely customizable, allowing the creation of several types of <a href=\"/symphony/blueprints/sections/edit/3/\">custom fields</a> that can be organized into <a href=\"/symphony/blueprints/sections/\">Sections</a> that appear under the <a href=\"/symphony/\">Publish</a> menu. You can see by editing <a href=\"/symphony/publish/pages/edit/32/\">this entry</a>, found in the <a href=\"/symphony/publish/pages/\">Pages</a> Section.</p>\n\n<p>The <a href=\"/symphony/blueprints/datasources/edit/page_details/\">XML data source</a> for the page content is configured with the Data Source Editor, found under the <a href=\"/symphony/blueprints/components/\">Blueprints : Components</a> menu. The data source is then attached to the <a href=\"/symphony/blueprints/pages/edit/1/\">page template</a> (click on the “Configure” button in the top right to view the data sources attached to a page). The data for this entry is converted into XML data to be transformed by XSL templates into HTML pages to be served to web browsers. To view the <a href=\"?debug\">XML data</a> for any front-end page, add   <code>?debug</code>   at the end of the URI of the page. Of course, this is only accessible to logged-in site administrators.</p>\n\n<h3>Powered by XSLT</h3>\n\n<p>All front-end pages are built with XSLT. You can find the page templates listed under the <a href=\"/symphony/blueprints/pages/\">Blueprints : Pages</a> menu. The <a href=\"/symphony/blueprints/pages/edit/1/\">page template</a> can be edited within the Symphony web interface, or you can use a FTP application to edit files directly on the server. The <a href=\"/symphony/blueprints/utilities/edit/public-master/\">master template</a> has been created as a utility that can be imported by page templates to control layout using XSL templates. Other templates can also be imported in this same way and can themselves import other templates.</p>\n\n<h3>Extensible and Customizable</h3>\n\n<p>Very little is assumed by Symphony. The application has been stripped down to mere essentials in order to allow developers to customize the interface as they like. Even <a href=\"/symphony/system/preferences/\">Preferences</a> are <a href=\"/symphony/system/extensions/\">Extensions</a> that are installed and enabled as required by the needs of the users and developers.</p>\n\n<p>Custom <a href=\"/symphony/blueprints/components/\">Events</a> can be written in PHP to provide additional functionality. Events are attached to page templates, enabling the ability for front-end forms. In this way, the core functionality of the system can be extended by building custom admin pages. The <a href=\"/site/\">Site Administration</a> system for this ensemble has been created to show the relationships between entries in linked sections. The ability to <a href=\"/site/pages/symphony/27/copy/\">copy entries</a> has been added by populating fields with data from other entries and saving this data as a new entry.</p>\n\n<p>Front end forms also allow for the ability to <a href=\"/symphony/blueprints/events/edit/publish_pages/\">edit multiple entries</a> at once. For example, all the menu items in the System Navigation bar can be edited by a single click by viewing a list of all the <a href=\"/site/pages/\">Pages</a> in the site, and clicking on the <a href=\"/site/pages/edit/\">Edit Pages</a> button at the bottom of the page. Entries can then be moved from one section to another through these custom admin pages, even though the core system does not provide this functionality with Section Links.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (353, 40, NULL, NULL);

-- *** STRUCTURE: `tbl_entries_data_14` ***
DROP TABLE IF EXISTS `tbl_entries_data_14`;
CREATE TABLE `tbl_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_14` ***
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (358, 10, 'symphony-publish-menus', '/symphony/publish/menus/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (366, 11, 'symphony-publish-sections', '/symphony/publish/sections/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (359, 12, 'symphony-publish-pages', '/symphony/publish/pages/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (360, 13, 'symphony-blueprints-pages', '/symphony/blueprints/pages/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (349, 14, 'symphony-blueprints-components', '/symphony/blueprints/components/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (367, 15, 'symphony-blueprints-sections', '/symphony/blueprints/sections/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (344, 16, 'symphony-system-authors', '/symphony/system/authors/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (365, 17, 'symphony-system-preferences', '/symphony/system/preferences/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (350, 18, 'symphony-system-extensions', '/symphony/system/extensions/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (363, 20, 'debug=xml', '?debug=xml');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (364, 21, 'dynamically-generated', '(dynamically generated)');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (362, 22, 'debug=result', '?debug=result');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (348, 23, 'profile=general', '?profile=general');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (345, 24, 'profile=data-sources', '?profile=data-sources');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (346, 25, 'profile=events', '?profile=events');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (347, 26, 'profile=render-statistics', '?profile=render-statistics');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (370, 27, 'http-symphony-cmscom', 'http://symphony-cms.com/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (355, 28, 'http-symphony-cmscom-forum', 'http://symphony-cms.com/forum/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (352, 31, 'http-githubcom-symphony-symphony-2-issues', 'http://github.com/symphony/symphony-2/issues');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (357, 33, 'login', '/login/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (369, 34, 'site', '/site/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (368, 35, 'system', '/system/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (373, 32, 'home', '/home/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (361, 19, 'debug=params', '?debug=params');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (353, 40, 'http-daringfireballnet-projects-markdown', 'http://daringfireball.net/projects/markdown/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (354, 29, 'http-symphony-cmscom-downloads', 'http://symphony-cms.com/downloads/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (351, 30, 'http-githubcom-symphony-symphony-2', 'http://github.com/symphony/symphony-2');

-- *** STRUCTURE: `tbl_entries_data_15` ***
DROP TABLE IF EXISTS `tbl_entries_data_15`;
CREATE TABLE `tbl_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=374 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_15` ***
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (358, 10, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (366, 11, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (359, 12, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (360, 13, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (349, 14, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (367, 15, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (344, 16, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (365, 17, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (350, 18, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (361, 19, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (363, 20, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (364, 21, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (362, 22, 4);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (348, 23, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (345, 24, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (346, 25, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (347, 26, 4);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (370, 27, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (355, 28, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (354, 29, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (351, 30, 4);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (352, 31, 5);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (373, 32, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (357, 33, 20);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (369, 34, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (368, 35, 10);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (353, 40, 10);

-- *** STRUCTURE: `tbl_entries_data_17` ***
DROP TABLE IF EXISTS `tbl_entries_data_17`;
CREATE TABLE `tbl_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_17` ***
INSERT INTO `tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (156, 1, 'no');
INSERT INTO `tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (157, 2, 'no');
INSERT INTO `tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (158, 36, 'no');
INSERT INTO `tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (159, 37, 'no');
INSERT INTO `tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (155, 38, 'no');

-- *** STRUCTURE: `tbl_entries_data_18` ***
DROP TABLE IF EXISTS `tbl_entries_data_18`;
CREATE TABLE `tbl_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_18` ***
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (169, 3, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (168, 4, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (167, 5, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (166, 6, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (165, 7, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (164, 8, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (163, 9, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (162, 39, 'yes');

-- *** STRUCTURE: `tbl_entries_data_19` ***
DROP TABLE IF EXISTS `tbl_entries_data_19`;
CREATE TABLE `tbl_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_19` ***
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (293, 10, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (301, 11, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (294, 12, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (295, 13, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (284, 14, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (302, 15, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (279, 16, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (300, 17, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (285, 18, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (296, 19, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (298, 20, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (299, 21, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (297, 22, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (283, 23, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (280, 24, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (281, 25, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (282, 26, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (305, 27, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (290, 28, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (289, 29, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (286, 30, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (287, 31, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (308, 32, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (292, 33, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (304, 34, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (303, 35, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (288, 40, 'no');

-- *** STRUCTURE: `tbl_entries_data_2` ***
DROP TABLE IF EXISTS `tbl_entries_data_2`;
CREATE TABLE `tbl_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_2` ***
INSERT INTO `tbl_entries_data_2` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (177, 1, 'Symphony Core System Menus', '<p>Symphony Core System Menus</p>\n');
INSERT INTO `tbl_entries_data_2` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (178, 2, 'Symphony Developer Menus', '<p>Symphony Developer Menus</p>\n');
INSERT INTO `tbl_entries_data_2` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (179, 36, 'This is the Public menu', '<p>This is the Public menu</p>\n');
INSERT INTO `tbl_entries_data_2` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (180, 37, 'Site Administration Menu', '<p>Site Administration Menu</p>\n');
INSERT INTO `tbl_entries_data_2` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (176, 38, 'Members Administration Menu', '<p>Members Administration Menu</p>\n');

-- *** STRUCTURE: `tbl_entries_data_20` ***
DROP TABLE IF EXISTS `tbl_entries_data_20`;
CREATE TABLE `tbl_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_20` ***
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (32, 32, 6);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (3, 16, 5);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (4, 24, 8);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (5, 25, 8);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (6, 26, 8);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (7, 23, 8);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (8, 14, 4);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (9, 18, 5);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (10, 30, 9);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (11, 31, 9);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (12, 40, 9);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (13, 29, 9);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (14, 28, 9);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (16, 33, 6);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (17, 10, 3);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (18, 12, 3);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (19, 13, 4);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (20, 19, 7);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (21, 22, 7);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (22, 20, 7);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (23, 21, 7);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (24, 17, 5);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (25, 11, 3);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (26, 15, 4);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (27, 35, 6);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (28, 34, 6);
INSERT INTO `tbl_entries_data_20` (`id`, `entry_id`, `relation_id`) VALUES (29, 27, 9);

-- *** STRUCTURE: `tbl_entries_data_21` ***
DROP TABLE IF EXISTS `tbl_entries_data_21`;
CREATE TABLE `tbl_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_21` ***
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (2, 39, 36);
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (3, 9, 2);
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (4, 8, 2);
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (5, 7, 2);
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (6, 6, 2);
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (7, 5, 1);
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (8, 4, 1);
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `relation_id`) VALUES (9, 3, 1);

-- *** STRUCTURE: `tbl_entries_data_3` ***
DROP TABLE IF EXISTS `tbl_entries_data_3`;
CREATE TABLE `tbl_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_3` ***
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (201, 3, 'content', 'Content');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (200, 4, 'blueprints', 'Blueprints');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (199, 5, 'system', 'System');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (198, 6, 'pages', 'Pages');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (197, 7, 'debug', 'Debug');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (196, 8, 'profile', 'Profile');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (195, 9, 'community', 'Community');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (194, 39, 'deleted', 'Deleted');

-- *** STRUCTURE: `tbl_entries_data_4` ***
DROP TABLE IF EXISTS `tbl_entries_data_4`;
CREATE TABLE `tbl_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_4` ***
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (197, 7, 'debug', '?debug');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (196, 8, 'profile', '?profile');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (195, 9, 'http-betaoverture21com-forum', 'http://beta.overture21.com/forum/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (201, 3, 'symphony-publish-sections', '/symphony/publish/sections/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (200, 4, 'symphony-blueprints-components', '/symphony/blueprints/components/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (199, 5, 'symphony-system-preferences', '/symphony/system/preferences/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (198, 6, 'symphony-blueprints-pages', '/symphony/blueprints/pages/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (194, 39, 'admin-sections-delete-39-delete', '/admin/sections/delete/39/delete/');

-- *** STRUCTURE: `tbl_entries_data_5` ***
DROP TABLE IF EXISTS `tbl_entries_data_5`;
CREATE TABLE `tbl_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_5` ***

-- *** STRUCTURE: `tbl_entries_data_6` ***
DROP TABLE IF EXISTS `tbl_entries_data_6`;
CREATE TABLE `tbl_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_6` ***
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (201, 3, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (200, 4, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (199, 5, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (197, 7, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (196, 8, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (195, 9, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (198, 6, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (194, 39, 'Delete these sections', '<p>Delete these sections</p>\n');

-- *** STRUCTURE: `tbl_entries_data_7` ***
DROP TABLE IF EXISTS `tbl_entries_data_7`;
CREATE TABLE `tbl_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_7` ***
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (201, 3, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (200, 4, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (199, 5, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (197, 7, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (196, 8, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (195, 9, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (198, 6, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (194, 39, NULL, NULL);

-- *** STRUCTURE: `tbl_entries_data_8` ***
DROP TABLE IF EXISTS `tbl_entries_data_8`;
CREATE TABLE `tbl_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_8` ***
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (201, 3, 1);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (200, 4, 2);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (199, 5, 3);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (198, 6, 4);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (197, 7, 5);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (196, 8, 6);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (195, 9, 7);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (194, 39, 10);

-- *** DATA: `tbl_entries` ***
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (1, 1, 1, '2008-03-21 07:37:13', '2008-03-21 14:37:13');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (2, 1, 1, '2008-03-21 07:37:47', '2008-03-21 14:37:47');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (3, 2, 1, '2008-03-21 07:39:16', '2008-03-21 14:39:16');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (4, 2, 1, '2008-03-21 07:40:39', '2008-03-21 14:40:39');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (5, 2, 1, '2008-03-21 07:41:58', '2008-03-21 14:41:58');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (6, 2, 1, '2008-03-21 07:48:33', '2008-03-21 14:48:33');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (7, 2, 1, '2008-03-21 07:49:15', '2008-03-21 14:49:15');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (8, 2, 1, '2008-03-21 07:49:31', '2008-03-21 14:49:31');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (9, 2, 1, '2008-03-21 07:50:38', '2008-03-21 14:50:38');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (10, 3, 1, '2008-03-21 07:53:36', '2008-03-21 14:53:36');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (11, 3, 1, '2008-03-21 07:54:59', '2008-03-21 14:54:59');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (12, 3, 1, '2008-03-21 07:55:15', '2008-03-21 14:55:15');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (13, 3, 1, '2008-03-21 07:56:02', '2008-03-21 14:56:02');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (14, 3, 1, '2008-03-21 07:56:26', '2008-03-21 14:56:26');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (15, 3, 1, '2008-03-21 07:58:21', '2008-03-21 14:58:21');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (16, 3, 1, '2008-03-21 07:59:10', '2008-03-21 14:59:10');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (17, 3, 1, '2008-03-21 07:59:38', '2008-03-21 14:59:38');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (18, 3, 1, '2008-03-21 07:59:53', '2008-03-21 14:59:53');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (19, 3, 1, '2008-03-21 09:55:15', '2008-03-21 16:55:15');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (20, 3, 1, '2008-03-21 09:56:09', '2008-03-21 16:56:09');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (21, 3, 1, '2008-03-21 10:03:19', '2008-03-21 17:03:19');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (22, 3, 1, '2008-03-21 10:03:37', '2008-03-21 17:03:37');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (23, 3, 1, '2008-03-21 12:30:22', '2008-03-21 19:30:22');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (24, 3, 1, '2008-03-21 12:30:47', '2008-03-21 19:30:47');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (25, 3, 1, '2008-03-21 12:31:04', '2008-03-21 19:31:04');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (26, 3, 1, '2008-03-21 12:31:27', '2008-03-21 19:31:27');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (27, 3, 1, '2008-03-21 12:32:17', '2008-03-21 19:32:17');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (28, 3, 1, '2008-03-21 12:32:41', '2008-03-21 19:32:41');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (29, 3, 1, '2008-03-21 12:33:15', '2008-03-21 19:33:15');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (30, 3, 1, '2008-03-21 12:33:38', '2008-03-21 19:33:38');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (31, 3, 1, '2008-03-21 12:33:58', '2008-03-21 19:33:58');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (32, 3, 1, '2008-03-21 12:34:52', '2008-03-21 19:34:52');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (33, 3, 1, '2008-03-22 11:45:40', '2008-03-22 18:45:40');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (34, 3, 1, '2008-03-22 11:48:35', '2008-03-22 18:48:35');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (35, 3, 1, '2008-03-22 11:50:17', '2008-03-22 18:50:17');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (36, 1, 0, '2008-03-23 08:23:43', '2008-03-23 15:23:43');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (37, 1, 0, '2008-03-23 08:28:36', '2008-03-23 15:28:36');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (38, 1, 0, '2008-03-23 08:45:07', '2008-03-23 15:45:07');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (39, 2, 0, '2008-03-27 06:53:11', '2008-03-27 13:53:11');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (40, 3, 0, '2008-03-28 07:44:36', '2008-03-28 14:44:36');

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (25, 'markdown', 'enabled', 1.9);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (22, 'selectbox_link_field', 'enabled', 1.18);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (24, 'maintenance_mode', 'enabled', 1.2);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (20, 'export_ensemble', 'enabled', 1.11);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (21, 'debugdevkit', 'enabled', '1.0.5');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (23, 'jit_image_manipulation', 'enabled', 1.08);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (26, 'profiledevkit', 'enabled', '1.0.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'numberfield', 'enabled', 1.4);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (38, 24, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (37, 24, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (36, 24, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (35, 24, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (39, 24, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (31, 21, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (30, 21, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (33, 23, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (41, 26, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (40, 26, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (34, 24, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (32, 23, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (29, 20, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Title', 'title', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'Description', 'description', 'textarea', 1, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Title', 'title', 'input', 2, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'URL', 'url', 'input', 2, 'no', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Heading', 'heading', 'input', 2, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Description', 'description', 'textarea', 2, 'no', 3, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Body', 'body', 'textarea', 2, 'no', 4, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'Sort', 'sort', 'number', 2, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (21, 'Menu', 'menu', 'selectbox_link', 2, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Title', 'title', 'input', 3, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Heading', 'heading', 'input', 3, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Description', 'description', 'textarea', 3, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (13, 'Body', 'body', 'textarea', 3, 'no', 3, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'URL', 'url', 'input', 3, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Sort', 'sort', 'number', 3, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (20, 'Section', 'section', 'selectbox_link', 3, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Deleted', 'deleted', 'checkbox', 1, 'no', 5, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Deleted', 'deleted', 'checkbox', 2, 'no', 7, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Deleted', 'deleted', 'checkbox', 3, 'no', 7, 'sidebar', 'yes');

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Home', 'home', NULL, NULL, 'current_page,menus,navigation,pages,sections', 'login', 0);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, NULL, 'Login', 'login', NULL, NULL, 'current_page,menus,navigation,pages,sections', 'login', 1);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (3, NULL, 'Site', 'site', NULL, 'menu/section/page', 'current_page,menu,menus,navigation,pages,pages_by_section,parent_page,section,sections,sections_by_menu,site_sections', 'login,publish_menus', 2);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (4, NULL, 'System', 'system', NULL, NULL, 'current_page,menus,navigation,pages,sections', 'login', 10);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (5, 3, 'Menus', 'menus', 'site', 'entry/id/action', 'current_page,menu_details,menus,navigation,page_details,pages,parent_page,section_details,sections,site_sections', 'login,publish_menu,publish_menus', 3);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (6, 3, 'Sections', 'sections', 'site', 'entry/id/action', 'current_page,menus,navigation,pages,parent_page,section_details,sections,site_sections', 'login,publish_section,publish_sections', 4);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (7, 3, 'Pages', 'pages', 'site', 'entry/id/action', 'current_page,menus,navigation,page_details,pages,parent_page,sections,site_sections', 'login,publish_page,publish_pages', 5);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (8, NULL, 'Calendar', 'calendar', NULL, 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,sections', 'login', 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (9, 8, 'Year', 'year', 'calendar', 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,sections', 'login', 7);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (10, 8, 'Week', 'week', 'calendar', 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,parent_page,sections', 'login', 8);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (11, 8, 'Day', 'day', 'calendar', 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,parent_page,sections', 'login', 9);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (134, 1, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (127, 3, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (132, 4, 'system');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (113, 2, 'login');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (131, 4, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (76, 5, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (129, 6, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (80, 7, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (128, 3, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (75, 5, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (130, 6, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (79, 7, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (84, 8, 'calendar');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (83, 8, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (88, 9, 'calendar');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (87, 9, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (100, 10, 'calendar');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (99, 10, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (98, 11, 'calendar');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (97, 11, 'admin');

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (1, 'Menus', 'menus', 1, NULL, 'asc', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (2, 'Sections', 'sections', 2, NULL, 'asc', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (3, 'Pages', 'pages', 3, 10, 'asc', 'no', 'Content');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (10, 1, 1, 2, 21, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (9, 2, 3, 3, 20, 'no');
