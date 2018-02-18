'use strict';
/* globals $, app */

define('admin/plugins/soleclub', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
		Settings.load('soleclub', $('.persona-settings'));

		$('#save').on('click', function() {
			Settings.save('soleclub', $('.persona-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'soleclub-saved',
					title: 'Settings Saved',
					message: 'Theme settings saved'
				});
			});
		});
	};

	return ACP;
});
