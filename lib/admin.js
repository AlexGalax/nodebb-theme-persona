'use strict';
/* globals $, app */

define('admin/plugins/soleclub', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
<<<<<<< HEAD
		Settings.load('soleclub', $('.persona-settings'));

		$('#save').on('click', function() {
			Settings.save('soleclub', $('.persona-settings'), function() {
=======
		Settings.load('soleclub', $('.soleclub-settings'));

		$('#save').on('click', function() {
			Settings.save('soleclub', $('.soleclub-settings'), function() {
>>>>>>> origin/master
				app.alert({
					type: 'success',
					alert_id: 'soleclub-saved',
					title: 'Settings Saved',
<<<<<<< HEAD
					message: 'Theme settings saved'
=======
					message: 'Soleclub theme settings saved'
>>>>>>> origin/master
				});
			});
		});
	};

	return ACP;
});
