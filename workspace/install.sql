
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (5, 17, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (6, 18, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (7, 19, 'off', NULL);

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `pre_populate` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `calendar` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (28, 1, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (29, 3, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (30, 4, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (31, 5, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (32, 10, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (33, 11, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (34, 14, NULL);

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
INSERT INTO `tbl_fields_sectionlink` (`id`, `field_id`, `section_association_list`) VALUES (7, 9, 1);
INSERT INTO `tbl_fields_sectionlink` (`id`, `field_id`, `section_association_list`) VALUES (8, 16, 2);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_selectbox_link` ***

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (22, 2, 'pb_markdownextrasmartypants', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (23, 6, 'pb_markdownextrasmartypants', 8);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (24, 7, 'pb_markdownextrasmartypants', 16);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (25, 12, 'pb_markdownextrasmartypants', 8);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (26, 13, 'pb_markdownextrasmartypants', 16);

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
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_10` ***
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (292, 10, 'menus', 'Menus');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (293, 11, 'sections', 'Sections');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (294, 12, 'pages', 'Pages');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (316, 13, 'pages', 'Pages');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (317, 14, 'components', 'Components');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (318, 15, 'sections', 'Sections');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (313, 16, 'authors', 'Authors');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (314, 17, 'preferences', 'Preferences');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (315, 18, 'extensions', 'Extensions');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (309, 19, 'parameters', 'Parameters');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (310, 20, 'xml', 'XML');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (311, 21, 'xsl', 'XSL');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (312, 22, 'result', 'Result');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (305, 23, 'general-details', 'General Details');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (306, 24, 'data-source-execution', 'Data Source Execution');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (307, 25, 'event-execution', 'Event Execution');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (308, 26, 'full-page-render-statistics', 'Full Page Render Statistics');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (333, 27, 'symphony', 'Symphony');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (334, 28, 'overture-forum', 'Overture Forum');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (336, 31, 'issues', 'Issues');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (341, 32, 'home', 'Home');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (332, 33, 'login', 'Login');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (296, 34, 'site', 'Site');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (297, 35, 'system', 'System');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (304, 40, 'markdown-syntax', 'Markdown Syntax');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (335, 29, 'overture-extensions', 'Overture Extensions');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `handle`, `value`) VALUES (302, 30, 'github-repository', 'Github Repository');

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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_11` ***
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (89, 33, 'login-status', 'Login Status');
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (73, 34, 'site-administration', 'Site Administration');
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (74, 35, 'system-administration', 'System Administration');
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (94, 32, 'calendar-04', 'Calendar 0.4');

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
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_12` ***
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (292, 10, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (293, 11, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (294, 12, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (316, 13, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (317, 14, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (318, 15, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (313, 16, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (314, 17, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (315, 18, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (309, 19, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (310, 20, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (311, 21, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (312, 22, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (305, 23, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (306, 24, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (307, 25, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (308, 26, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (333, 27, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (334, 28, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (335, 29, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (302, 30, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (336, 31, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (332, 33, 'You will need to login to access the administration area. Please provide your username and password below.', '<p>You will need to login to access the administration area. Please provide your username and password below.</p>\n');
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (296, 34, 'An area where I can have a list of favourite sites, tools, etc.', '<p>An area where I can have a list of favourite sites, tools, etc.</p>\n');
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (297, 35, 'This area is strictly for managing the backend of the site.', '<p>This area is strictly for managing the backend of the site.</p>\n');
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (304, 40, NULL, NULL);
INSERT INTO `tbl_entries_data_12` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (341, 32, '### A Symphony Ensemble\r\n\r\nVersion 0.4 | 24 Feb 2010\r\n\r\nThe Calendar Symphony Ensemble has been created specifically with the goal of managing dates and calendars. Keep in mind that this ensemble is in an experimental state. Hopefully, it will provide a starting point on which to build your own ideas. To view the application, you will need to [log in](/login/).\r\n\r\nDeveloped by Stephen Bau, [MGDC](http://www.gdc.net/join/member/articles103.php), Lead Designer, [Domain7 Solutions Inc](http://www.domain7.com/)\r\n\r\n### Notes\r\n\r\n* The calendar application includes [year](/calendar/year/), [month](/calendar/), [week](/calendar/week/) and [day](/calendar/day/) views.\r\n* Consult the [Symphony CMS Forum](http://symphony-cms.com/forum/discussions/201/) for more information\r\n\r\n### Change Log\r\n\r\n* Version 0.4 - 22 Feb 2010 - Updated Ensemble to Symphony 2.0.6\r\n* Version 0.3 - 4 July 2009 - Updated Ensemble to Symphony 2.0.3\r\n* Version 0.2 - 21 December 2008 - Updated Ensemble to Symphony 2.0\r\n* Version 0.1 - 11 April 2008 - Symphony 2 Beta Revision 5\r\n', '<h3>A Symphony Ensemble</h3>\n\n<p>Version 0.4 | 24 Feb 2010</p>\n\n<p>The Calendar Symphony Ensemble has been created specifically with the goal of managing dates and calendars. Keep in mind that this ensemble is in an experimental state. Hopefully, it will provide a starting point on which to build your own ideas. To view the application, you will need to <a href=\"/login/\">log in</a>.</p>\n\n<p>Developed by Stephen Bau, <a href=\"http://www.gdc.net/join/member/articles103.php\">MGDC</a>, Lead Designer, <a href=\"http://www.domain7.com/\">Domain7 Solutions Inc</a></p>\n\n<h3>Notes</h3>\n\n<ul>\n<li>The calendar application includes <a href=\"/calendar/year/\">year</a>, <a href=\"/calendar/\">month</a>, <a href=\"/calendar/week/\">week</a> and <a href=\"/calendar/day/\">day</a> views.</li>\n<li>Consult the <a href=\"http://symphony-cms.com/forum/discussions/201/\">Symphony CMS Forum</a> for more information</li>\n</ul>\n\n<h3>Change Log</h3>\n\n<ul>\n<li>Version 0.4 - 22 Feb 2010 - Updated Ensemble to Symphony 2.0.6</li>\n<li>Version 0.3 - 4 July 2009 - Updated Ensemble to Symphony 2.0.3</li>\n<li>Version 0.2 - 21 December 2008 - Updated Ensemble to Symphony 2.0</li>\n<li>Version 0.1 - 11 April 2008 - Symphony 2 Beta Revision 5</li>\n</ul>\n');

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
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_13` ***
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (292, 10, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (293, 11, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (294, 12, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (316, 13, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (317, 14, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (318, 15, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (313, 16, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (314, 17, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (315, 18, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (309, 19, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (310, 20, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (311, 21, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (312, 22, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (305, 23, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (306, 24, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (307, 25, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (308, 26, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (333, 27, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (334, 28, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (335, 29, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (302, 30, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (336, 31, NULL, NULL);
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (332, 33, 'To find out more about this Symphony Ensemble, read more about the features in this version on the home page. An extended entry is shown on the [home page](/) when you log in.', '<p>To find out more about this Symphony Ensemble, read more about the features in this version on the home page. An extended entry is shown on the <a href=\"/\">home page</a> when you log in.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (296, 34, 'It can have a list of sites that I am currently working on, a list of commonly used resources, and a list of things to do.', '<p>It can have a list of sites that I am currently working on, a list of commonly used resources, and a list of things to do.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (297, 35, 'This would involve the mechanics of building the site in Symphony. All of these items can be hidden from the general users of the site.', '<p>This would involve the mechanics of building the site in Symphony. All of these items can be hidden from the general users of the site.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (341, 32, '### Symphony 2.0\r\n\r\nThis is an experiment to build an application with [Symphony](http://symphony-cms.com/). Youâ€™ll notice that once you are logged in, you have access to a number of additional features. Most notable is the system navigation bar at the top of the page that is only visible to users that are logged in to custom admin pages. This feature is not available to the Symphony core pages that you can find in the [Symphony admin area](/symphony/).\r\n\r\nTo switch this feature off, you can edit the [system-navigation.xsl](/symphony/blueprints/utilities/edit/system-navigation/) utility. The     `system-navigation` template has a parameter called `system-navigation-switch`     which you can give any value other than `\'on\'` to turn this feature off.\r\n\r\nYouâ€™ll also notice that there are three admin areas: [Site](/site/), [System](/system/) and [Symphony](/symphony/).\r\n\r\nThere are also three sections in the Publish menu: [Menus](/symphony/publish/menus/), [Sections](/symphony/publish/sections/) and [Pages](/symphony/publish/pages/).\r\n\r\nAlso, note that I am using [Markdown](http://daringfireball.net/projects/markdown/) to format my entries, but I am also using Allen Changâ€™s [typography.xsl](http://symphony-cms.com/forum/discussions/152/) file with some slight additions to ensure that the URLs that I am using here will always point to the right place, regardless of whether this site is published at the root of a domain or deep in a subdirectory. Just be sure to format all internal links with a leading slash for all links relative to the root of this install of Symphony.\r\n\r\n### Powered by XML\r\n\r\nInformation is stored in a MySQL database and can be easily edited through the [Symphony administration interface](/symphony/). The interface is extremely customizable, allowing the creation of several types of [custom fields](/symphony/blueprints/sections/edit/3/) that can be organized into [Sections](/symphony/blueprints/sections/) that appear under the [Publish](/symphony/) menu. You can see by editing [this entry](/symphony/publish/pages/edit/32/), found in the [Pages](/symphony/publish/pages/) Section.\r\n\r\nThe [XML data source](/symphony/blueprints/datasources/edit/page_details/) for the page content is configured with the Data Source Editor, found under the [Blueprints : Components](/symphony/blueprints/components/) menu. The data source is then attached to the [page template](/symphony/blueprints/pages/edit/1/) (click on the â€œConfigureâ€ button in the top right to view the data sources attached to a page). The data for this entry is converted into XML data to be transformed by XSL templates into HTML pages to be served to web browsers. To view the [XML data](?debug) for any front-end page, add   `?debug`   at the end of the URI of the page. Of course, this is only accessible to logged-in site administrators.\r\n\r\n### Powered by XSLT\r\n\r\nAll front-end pages are built with XSLT. You can find the page templates listed under the [Blueprints : Pages](/symphony/blueprints/pages/) menu. The [page template](/symphony/blueprints/pages/edit/1/) can be edited within the Symphony web interface, or you can use a FTP application to edit files directly on the server. The [master template](/symphony/blueprints/utilities/edit/public-master/) has been created as a utility that can be imported by page templates to control layout using XSL templates. Other templates can also be imported in this same way and can themselves import other templates.\r\n\r\n### Extensible and Customizable\r\n\r\nVery little is assumed by Symphony. The application has been stripped down to mere essentials in order to allow developers to customize the interface as they like. Even [Preferences](/symphony/system/preferences/) are [Extensions](/symphony/system/extensions/) that are installed and enabled as required by the needs of the users and developers.\r\n\r\nCustom [Events](/symphony/blueprints/components/) can be written in PHP to provide additional functionality. Events are attached to page templates, enabling the ability for front-end forms. In this way, the core functionality of the system can be extended by building custom admin pages. The [Site Administration](/site/) system for this ensemble has been created to show the relationships between entries in linked sections. The ability to [copy entries](/site/pages/symphony/27/copy/) has been added by populating fields with data from other entries and saving this data as a new entry.\r\n\r\nFront end forms also allow for the ability to [edit multiple entries](/symphony/blueprints/events/edit/publish_pages/) at once. For example, all the menu items in the System Navigation bar can be edited by a single click by viewing a list of all the [Pages](/site/pages/) in the site, and clicking on the [Edit Pages](/site/pages/edit/) button at the bottom of the page. Entries can then be moved from one section to another through these custom admin pages, even though the core system does not provide this functionality with Section Links.', '<h3>Symphony 2.0</h3>\n\n<p>This is an experiment to build an application with <a href=\"http://symphony-cms.com/\">Symphony</a>. Youâ€™ll notice that once you are logged in, you have access to a number of additional features. Most notable is the system navigation bar at the top of the page that is only visible to users that are logged in to custom admin pages. This feature is not available to the Symphony core pages that you can find in the <a href=\"/symphony/\">Symphony admin area</a>.</p>\n\n<p>To switch this feature off, you can edit the <a href=\"/symphony/blueprints/utilities/edit/system-navigation/\">system-navigation.xsl</a> utility. The     <code>system-navigation</code> template has a parameter called <code>system-navigation-switch</code>     which you can give any value other than <code>\'on\'</code> to turn this feature off.</p>\n\n<p>Youâ€™ll also notice that there are three admin areas: <a href=\"/site/\">Site</a>, <a href=\"/system/\">System</a> and <a href=\"/symphony/\">Symphony</a>.</p>\n\n<p>There are also three sections in the Publish menu: <a href=\"/symphony/publish/menus/\">Menus</a>, <a href=\"/symphony/publish/sections/\">Sections</a> and <a href=\"/symphony/publish/pages/\">Pages</a>.</p>\n\n<p>Also, note that I am using <a href=\"http://daringfireball.net/projects/markdown/\">Markdown</a> to format my entries, but I am also using Allen Changâ€™s <a href=\"http://symphony-cms.com/forum/discussions/152/\">typography.xsl</a> file with some slight additions to ensure that the URLs that I am using here will always point to the right place, regardless of whether this site is published at the root of a domain or deep in a subdirectory. Just be sure to format all internal links with a leading slash for all links relative to the root of this install of Symphony.</p>\n\n<h3>Powered by XML</h3>\n\n<p>Information is stored in a MySQL database and can be easily edited through the <a href=\"/symphony/\">Symphony administration interface</a>. The interface is extremely customizable, allowing the creation of several types of <a href=\"/symphony/blueprints/sections/edit/3/\">custom fields</a> that can be organized into <a href=\"/symphony/blueprints/sections/\">Sections</a> that appear under the <a href=\"/symphony/\">Publish</a> menu. You can see by editing <a href=\"/symphony/publish/pages/edit/32/\">this entry</a>, found in the <a href=\"/symphony/publish/pages/\">Pages</a> Section.</p>\n\n<p>The <a href=\"/symphony/blueprints/datasources/edit/page_details/\">XML data source</a> for the page content is configured with the Data Source Editor, found under the <a href=\"/symphony/blueprints/components/\">Blueprints : Components</a> menu. The data source is then attached to the <a href=\"/symphony/blueprints/pages/edit/1/\">page template</a> (click on the â€œConfigureâ€ button in the top right to view the data sources attached to a page). The data for this entry is converted into XML data to be transformed by XSL templates into HTML pages to be served to web browsers. To view the <a href=\"?debug\">XML data</a> for any front-end page, add   <code>?debug</code>   at the end of the URI of the page. Of course, this is only accessible to logged-in site administrators.</p>\n\n<h3>Powered by XSLT</h3>\n\n<p>All front-end pages are built with XSLT. You can find the page templates listed under the <a href=\"/symphony/blueprints/pages/\">Blueprints : Pages</a> menu. The <a href=\"/symphony/blueprints/pages/edit/1/\">page template</a> can be edited within the Symphony web interface, or you can use a FTP application to edit files directly on the server. The <a href=\"/symphony/blueprints/utilities/edit/public-master/\">master template</a> has been created as a utility that can be imported by page templates to control layout using XSL templates. Other templates can also be imported in this same way and can themselves import other templates.</p>\n\n<h3>Extensible and Customizable</h3>\n\n<p>Very little is assumed by Symphony. The application has been stripped down to mere essentials in order to allow developers to customize the interface as they like. Even <a href=\"/symphony/system/preferences/\">Preferences</a> are <a href=\"/symphony/system/extensions/\">Extensions</a> that are installed and enabled as required by the needs of the users and developers.</p>\n\n<p>Custom <a href=\"/symphony/blueprints/components/\">Events</a> can be written in PHP to provide additional functionality. Events are attached to page templates, enabling the ability for front-end forms. In this way, the core functionality of the system can be extended by building custom admin pages. The <a href=\"/site/\">Site Administration</a> system for this ensemble has been created to show the relationships between entries in linked sections. The ability to <a href=\"/site/pages/symphony/27/copy/\">copy entries</a> has been added by populating fields with data from other entries and saving this data as a new entry.</p>\n\n<p>Front end forms also allow for the ability to <a href=\"/symphony/blueprints/events/edit/publish_pages/\">edit multiple entries</a> at once. For example, all the menu items in the System Navigation bar can be edited by a single click by viewing a list of all the <a href=\"/site/pages/\">Pages</a> in the site, and clicking on the <a href=\"/site/pages/edit/\">Edit Pages</a> button at the bottom of the page. Entries can then be moved from one section to another through these custom admin pages, even though the core system does not provide this functionality with Section Links.</p>\n');
INSERT INTO `tbl_entries_data_13` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (304, 40, NULL, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_14` ***
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (292, 10, 'symphony-publish-menus', '/symphony/publish/menus/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (293, 11, 'symphony-publish-sections', '/symphony/publish/sections/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (294, 12, 'symphony-publish-pages', '/symphony/publish/pages/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (316, 13, 'symphony-blueprints-pages', '/symphony/blueprints/pages/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (317, 14, 'symphony-blueprints-components', '/symphony/blueprints/components/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (318, 15, 'symphony-blueprints-sections', '/symphony/blueprints/sections/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (313, 16, 'symphony-system-authors', '/symphony/system/authors/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (314, 17, 'symphony-system-preferences', '/symphony/system/preferences/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (315, 18, 'symphony-system-extensions', '/symphony/system/extensions/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (310, 20, 'debug=xml', '?debug=xml');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (311, 21, 'dynamically-generated', '(dynamically generated)');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (312, 22, 'debug=result', '?debug=result');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (305, 23, 'profile=general', '?profile=general');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (306, 24, 'profile=data-sources', '?profile=data-sources');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (307, 25, 'profile=events', '?profile=events');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (308, 26, 'profile=render-statistics', '?profile=render-statistics');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (333, 27, 'http-symphony-cmscom', 'http://symphony-cms.com/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (334, 28, 'http-symphony-cmscom-forum', 'http://symphony-cms.com/forum/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (336, 31, 'http-githubcom-symphony-symphony-2-issues', 'http://github.com/symphony/symphony-2/issues');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (332, 33, 'login', '/login/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (296, 34, 'site', '/site/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (297, 35, 'system', '/system/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (341, 32, 'home', '/home/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (309, 19, 'debug=params', '?debug=params');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (304, 40, 'http-daringfireballnet-projects-markdown', 'http://daringfireball.net/projects/markdown/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (335, 29, 'http-symphony-cmscom-downloads', 'http://symphony-cms.com/downloads/');
INSERT INTO `tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (302, 30, 'http-githubcom-symphony-symphony-2', 'http://github.com/symphony/symphony-2');

-- *** STRUCTURE: `tbl_entries_data_15` ***
DROP TABLE IF EXISTS `tbl_entries_data_15`;
CREATE TABLE `tbl_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_15` ***
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (292, 10, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (293, 11, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (294, 12, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (316, 13, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (317, 14, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (318, 15, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (313, 16, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (314, 17, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (315, 18, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (309, 19, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (310, 20, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (311, 21, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (312, 22, 4);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (305, 23, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (306, 24, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (307, 25, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (308, 26, 4);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (333, 27, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (334, 28, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (335, 29, 3);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (302, 30, 4);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (336, 31, 5);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (341, 32, 1);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (332, 33, 20);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (296, 34, 2);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (297, 35, 10);
INSERT INTO `tbl_entries_data_15` (`id`, `entry_id`, `value`) VALUES (304, 40, 10);

-- *** STRUCTURE: `tbl_entries_data_16` ***
DROP TABLE IF EXISTS `tbl_entries_data_16`;
CREATE TABLE `tbl_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `relation_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_16` ***
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (292, 10, 3);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (293, 11, 3);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (294, 12, 3);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (316, 13, 4);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (317, 14, 4);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (318, 15, 4);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (313, 16, 5);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (314, 17, 5);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (315, 18, 5);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (309, 19, 7);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (310, 20, 7);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (311, 21, 7);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (312, 22, 7);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (305, 23, 8);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (306, 24, 8);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (307, 25, 8);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (308, 26, 8);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (333, 27, 9);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (334, 28, 9);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (335, 29, 9);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (302, 30, 9);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (336, 31, 9);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (341, 32, 6);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (332, 33, 6);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (296, 34, 6);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (297, 35, 6);
INSERT INTO `tbl_entries_data_16` (`id`, `entry_id`, `relation_id`) VALUES (304, 40, 9);

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
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_18` ***
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (159, 3, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (160, 4, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (152, 5, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (153, 6, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (154, 7, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (155, 8, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (156, 9, 'no');
INSERT INTO `tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (157, 39, 'yes');

-- *** STRUCTURE: `tbl_entries_data_19` ***
DROP TABLE IF EXISTS `tbl_entries_data_19`;
CREATE TABLE `tbl_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=277 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_19` ***
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (227, 10, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (228, 11, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (229, 12, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (251, 13, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (252, 14, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (253, 15, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (248, 16, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (249, 17, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (250, 18, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (244, 19, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (245, 20, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (246, 21, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (247, 22, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (240, 23, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (241, 24, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (242, 25, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (243, 26, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (268, 27, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (269, 28, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (270, 29, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (237, 30, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (271, 31, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (276, 32, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (267, 33, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (231, 34, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (232, 35, 'no');
INSERT INTO `tbl_entries_data_19` (`id`, `entry_id`, `value`) VALUES (239, 40, 'no');

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
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_3` ***
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (191, 3, 'content', 'Content');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (192, 4, 'blueprints', 'Blueprints');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (184, 5, 'system', 'System');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (185, 6, 'pages', 'Pages');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (186, 7, 'debug', 'Debug');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (187, 8, 'profile', 'Profile');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (188, 9, 'community', 'Community');
INSERT INTO `tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`) VALUES (189, 39, 'deleted', 'Deleted');

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
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_4` ***
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (186, 7, 'debug', '?debug');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (187, 8, 'profile', '?profile');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (188, 9, 'http-betaoverture21com-forum', 'http://beta.overture21.com/forum/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (191, 3, 'symphony-publish-sections', '/symphony/publish/sections/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (192, 4, 'symphony-blueprints-components', '/symphony/blueprints/components/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (184, 5, 'symphony-system-preferences', '/symphony/system/preferences/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (185, 6, 'symphony-blueprints-pages', '/symphony/blueprints/pages/');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES (189, 39, 'admin-sections-delete-39-delete', '/admin/sections/delete/39/delete/');

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
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (41, 39, 'blah', 'blah');

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
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_6` ***
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (191, 3, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (192, 4, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (184, 5, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (186, 7, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (187, 8, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (188, 9, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (185, 6, NULL, NULL);
INSERT INTO `tbl_entries_data_6` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (189, 39, 'Delete these sections', '<p>Delete these sections</p>\n');

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
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_7` ***
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (191, 3, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (192, 4, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (184, 5, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (186, 7, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (187, 8, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (188, 9, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (185, 6, NULL, NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (189, 39, 'blah', '<p>blah</p>\n');

-- *** STRUCTURE: `tbl_entries_data_8` ***
DROP TABLE IF EXISTS `tbl_entries_data_8`;
CREATE TABLE `tbl_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_8` ***
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (191, 3, 1);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (192, 4, 2);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (184, 5, 3);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (185, 6, 4);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (186, 7, 5);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (187, 8, 6);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (188, 9, 7);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `value`) VALUES (189, 39, 10);

-- *** STRUCTURE: `tbl_entries_data_9` ***
DROP TABLE IF EXISTS `tbl_entries_data_9`;
CREATE TABLE `tbl_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `relation_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_9` ***
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (191, 3, 1);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (192, 4, 1);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (184, 5, 1);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (185, 6, 2);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (186, 7, 2);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (187, 8, 2);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (188, 9, 2);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `relation_id`) VALUES (189, 39, 36);

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
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'markdown', 'enabled', 1.8);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'selectbox_link_field', 'enabled', 1.9);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'maintenance_mode', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (20, 'export_ensemble', 'enabled', 1.11);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'debugdevkit', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (14, 'jit_image_manipulation', 'enabled', 1.05);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'profiledevkit', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'numberfield', 'enabled', 1.4);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (19, 10, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (18, 10, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (17, 10, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (16, 10, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (15, 10, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (8, 5, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (9, 5, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (22, 14, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (12, 8, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (13, 8, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (20, 10, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (23, 14, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (29, 20, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Title', 'title', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'Description', 'description', 'textarea', 1, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Title', 'title', 'input', 2, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'URL', 'url', 'input', 2, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Heading', 'heading', 'input', 2, 'no', 8, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Description', 'description', 'textarea', 2, 'no', 12, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Body', 'body', 'textarea', 2, 'no', 13, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'Sort', 'sort', 'number', 2, 'no', 14, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Menu', 'menu', 'sectionlink', 2, 'no', 15, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Title', 'title', 'input', 3, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Heading', 'heading', 'input', 3, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Description', 'description', 'textarea', 3, 'no', 8, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (13, 'Body', 'body', 'textarea', 3, 'no', 9, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'URL', 'url', 'input', 3, 'no', 10, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Sort', 'sort', 'number', 3, 'no', 14, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Section', 'section', 'sectionlink', 3, 'no', 15, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Deleted', 'deleted', 'checkbox', 1, 'no', 5, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Deleted', 'deleted', 'checkbox', 2, 'no', 16, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Deleted', 'deleted', 'checkbox', 3, 'no', 16, 'sidebar', 'yes');

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Home', 'home', NULL, NULL, 'menus,navigation,current_page,pages,sections', 'login', 0);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, NULL, 'Login', 'login', NULL, NULL, 'menus,navigation,current_page,pages,sections', 'login', 1);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (3, NULL, 'Site', 'site', NULL, 'menu/section/page', 'current_page,menu,menus,navigation,page,pages,pages_by_section,section,sections,sections_by_menu,site_sections', 'login,publish_menus', 2);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (4, NULL, 'System', 'system', NULL, NULL, 'menus,navigation,current_page,pages,sections', 'login', 10);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (5, 3, 'Menus', 'menus', 'site', 'entry/id/action', 'current_page,menu_details,menus,navigation,page_details,pages,parent_page,section_details,sections,site_sections', 'login,publish_menu,publish_menus', 3);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (6, 3, 'Sections', 'sections', 'site', 'entry/id/action', 'current_page,menus,navigation,pages,parent_page,section_details,sections,site_sections', 'login,publish_section,publish_sections', 4);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (7, 3, 'Pages', 'pages', 'site', 'entry/id/action', 'current_page,menus,navigation,page_details,pages,parent_page,sections,site_sections', 'login,publish_page,publish_pages', 5);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (8, NULL, 'Calendar', 'calendar', NULL, 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,sections', 'login', 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (9, 8, 'Year', 'year', 'calendar', 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,sections', 'login', 7);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (10, 8, 'Week', 'week', 'calendar', 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,parent_page,sections', 'login', 8);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (11, 8, 'Day', 'day', 'calendar', 'year/month/day/section/event', 'calendar,current_page,menus,navigation,pages,parent_page,sections', 'login', 9);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (8, 1, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (68, 3, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (31, 4, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (34, 2, 'login');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (32, 4, 'system');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (76, 5, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (78, 6, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (80, 7, 'site');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (67, 3, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (75, 5, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (77, 6, 'admin');
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
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (7, 1, NULL, 2, 9, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (8, 2, NULL, 3, 16, 'yes');