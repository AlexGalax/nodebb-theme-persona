'use strict';

var async = require('async');
var striptags = require('striptags');
var meta = module.parent.require('./meta');
var user = module.parent.require('./user');

var library = {};

var app, themeConfig;

var rulesList = [
	{
		name: 'facebook',
		match: /(?:<a.*?)?((?:https?:\/\/)?(?:www\.)?(?:facebook\.com\/(?:.*)\/)([a-zA-Z0-9/_-]{6,}))["|'](?:.*?\/a>)?/g,
		template: 'partials/amp-facebook'
	},{
		name: 'twitter',
		match: /(?:<a.*?)?(?:https?:\/\/)?(?:www\.)?(?:twitter\.com\/(?:.*)\/)([a-zA-Z0-9_-]{6,20})(?:.*?\/a>)?/g,
		template: 'partials/amp-twitter'
	},{
		name: 'instagram',
		match: /(?:<a.*?)?(?:https?:\/\/)?(?:www\.)?(?:instagram\.com\/p\/)([a-zA-Z0-9_-]{6,20})(?:.*?\/a>)?/g,
		template: 'partials/amp-instagram'
	},{
		name: 'soundcloud-track',
		match: /(?:<a.*?)?(?:https?:\/\/)?(?:api\.)?(?:soundcloud\.com\/tracks\/)([0-9]{6,20})(?:.*?\/a>)/g,
		template: 'partials/amp-soundcloud-track'
	},{
		name: 'soundcloud-playlist',
		match: /(?:<a.*?)?(?:https?:\/\/)?(?:api\.)?(?:soundcloud\.com\/playlists\/)([0-9]{6,20})(?:.*?\/a>)/g,
		template: 'partials/amp-soundcloud-playlist'
	},{
		name: 'mp3',
		match: /<a .*?href=["|'](https?:\/\/.*?\.mp3)["|'].*?<\/a>/g,
		template: 'partials/amp-audio'
	}
];

library.init = function(params, callback) {
	app = params.app;
	var router = params.router;
	var middleware = params.middleware;

<<<<<<< HEAD
	router.get('/admin/plugins/soleclub', middleware.admin.buildHeader, renderAdmin);
	router.get('/api/admin/plugins/soleclub', renderAdmin);
=======
	app.get('/admin/plugins/soleclubtheme', middleware.admin.buildHeader, renderAdmin);
	app.get('/api/admin/plugins/soleclubtheme', renderAdmin);
>>>>>>> origin/master

	callback();
};

library.addAdminNavigation = function(header, callback) {
	header.plugins.push({
<<<<<<< HEAD
		route: '/plugins/soleclub',
		icon: 'fa-paint-brush',
		name: 'SoleClub Theme'
=======
		route: '/plugins/soleclubtheme',
		icon: 'fa-paint-brush',
		name: 'Soleclub Theme'
>>>>>>> origin/master
	});

	callback(null, header);
};

library.getTeasers = function(data, callback) {
	data.teasers.forEach(function(teaser) {
		if (teaser && teaser.content) {
			teaser.content = striptags(reaser.content, ['img']);
		}
	});
	callback(null, data);
};

library.defineWidgetAreas = function(areas, callback) {
	areas = areas.concat([
		{
			name: "Categories Sidebar",
			template: "categories.tpl",
			location: "sidebar"
		},
		{
			name: "Category Sidebar",
			template: "category.tpl",
			location: "sidebar"
		},
		{
			name: "Topic Sidebar",
			template: "topic.tpl",
			location: "sidebar"
		},
		{
			name: "Categories Header",
			template: "categories.tpl",
			location: "header"
		},
		{
			name: "Category Header",
			template: "category.tpl",
			location: "header"
		},
		{
			name: "Topic Header",
			template: "topic.tpl",
			location: "header"
		},
		{
			name: "Categories Footer",
			template: "categories.tpl",
			location: "footer"
		},
		{
			name: "Category Footer",
			template: "category.tpl",
			location: "footer"
		},
		{
			name: "Topic Footer",
			template: "topic.tpl",
			location: "footer"
		}
	]);

	callback(null, areas);
};

library.getThemeConfig = function(config, callback) {

<<<<<<< HEAD
	meta.settings.get('soleclub', function(err, settings) {
=======
	meta.settings.get('soleclubtheme', function(err, settings) {
>>>>>>> origin/master
		config.hideSubCategories = settings.hideSubCategories === 'on';
		config.hideCategoryLastPost = settings.hideCategoryLastPost === 'on';
		config.enableQuickReply = settings.enableQuickReply === 'on';
		config.enableAmpSupport = settings.enableAmpSupport === 'on';
	});

	themeConfig = config;

	callback(false, config);
};

function renderAdmin(req, res, next) {
<<<<<<< HEAD
	res.render('admin/plugins/soleclub', {});
=======
	res.render('admin/plugins/soleclubtheme', {});
>>>>>>> origin/master
}

library.addUserToTopic = function(data, callback) {
	if (data.req.user) {
		user.getUserData(data.req.user.uid, function(err, userdata) {
			if (err) {
				return callback(err);
			}

			data.templateData.loggedInUser = userdata;
			callback(null, data);
		});
	} else {
		callback(null, data);
	}
};

library.parsePost = function (payload, callback) {

	var content = payload.postData.content,
		matches, result;

	if (!content) {
		return callback(null, payload);
	}

	async.reduce(rulesList, content, function(content, rule, nextRule) {
		matches = content.match(rule.match);
		async.reduce(matches, content, function(content, match, nextMatch) {
			result = rule.match.exec(match);
			app.render(rule.template, {
				dataid: result[1]
			}, function(err, html) {
				console.log(content);
				content = content.replace(result[0], html);
				nextMatch(null, content);
			});
		},function(err, result){
			nextRule(null, result)
		});
	}, function(err, result){
		payload.postData.content = result;
		callback(null, payload);
	});

};

module.exports = library;
