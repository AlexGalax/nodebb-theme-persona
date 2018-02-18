<div class="panel panel-default">
	<div class="clearfix post-header panel-heading ">
		<div class="icon pull-left">
			<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
				<!-- IF posts.user.picture -->
				<img component="user/picture" data-uid="{posts.user.uid}" src="{posts.user.picture}" align="left" itemprop="image" />
				<!-- ELSE -->
				<div component="user/picture" data-uid="{posts.user.uid}" class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
				<!-- ENDIF posts.user.picture -->
				<i component="user/status" class="fa fa-circle status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>

			</a>
		</div>

		<div class="pull-left">
			<strong>
				<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.username}</a>
			</strong>

			<!-- IMPORT partials/topic/badge.tpl -->

			<!-- IF posts.user.banned -->
			<span class="label label-danger">[[user:banned]]</span>
			<!-- ENDIF posts.user.banned -->

<<<<<<< HEAD
			<div class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
				<a class="permalink" href="{config.relative_path}/post/{posts.pid}"><span class="timeago" title="{posts.timestampISO}"></span></a>
=======
		<span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
			<a class="permalink" href="{config.relative_path}/post/{posts.pid}"><span class="timeago" title="{posts.timestampISO}"></span></a>
>>>>>>> refs/remotes/NodeBB/master

				<i class="fa fa-pencil-square pointer edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>

				<small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></small>

				<!-- IF posts.toPid -->
				<a component="post/parent" class="btn btn-xs btn-default hidden-xs" data-topid="{posts.toPid}" href="/post/{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></a>
				<!-- ENDIF posts.toPid -->

<<<<<<< HEAD
				<span>
					<!-- IF posts.user.custom_profile_info.length -->
					&#124;
					<!-- BEGIN custom_profile_info -->
					{posts.user.custom_profile_info.content}
					<!-- END custom_profile_info -->
					<!-- ENDIF posts.user.custom_profile_info.length -->
				</span>
			</div>
			<span class="bookmarked"><i class="fa fa-bookmark-o"></i></span>
=======
			<span>
				<!-- IF posts.user.custom_profile_info.length -->
				&#124;
				<!-- BEGIN custom_profile_info -->
				{posts.user.custom_profile_info.content}
				<!-- END custom_profile_info -->
				<!-- ENDIF posts.user.custom_profile_info.length -->
			</span>
		</span>
		<span class="bookmarked"><i class="fa fa-bookmark-o"></i></span>
>>>>>>> refs/remotes/NodeBB/master

		</div>
	</div>
	<div class="panel-body row">
		<div class="content" component="post/content" itemprop="text">
			{posts.content}
		</div>
	</div>
	<div class="clearfix post-footer panel-footer">

		<!--<div class="share">
			<amp-social-share data-param-url="{config.url}/post/{posts.pid}" type="email"></amp-social-share>
  			<amp-social-share data-param-url="{config.url}/post/{posts.pid}" type="facebook" data-param-app_id="254325784911610"></amp-social-share>
  			<amp-social-share data-param-url="{config.url}/post/{posts.pid}" type="gplus"></amp-social-share>
  			<amp-social-share data-param-url="{config.url}/post/{posts.pid}" type="pinterest" data-param-media="https://ampbyexample.com/img/amp.jpg"></amp-social-share>
  			<amp-social-share data-param-url="{config.url}/post/{posts.pid}" type="tumblr"></amp-social-share>
  			<amp-social-share data-param-url="{config.url}/post/{posts.pid}" type="twitter"></amp-social-share>
  			<amp-social-share data-param-url="{config.url}/post/{posts.pid}" type="whatsapp"></amp-social-share>
		</div>-->
		
		<!-- IF posts.user.signature -->
		<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
		<!-- ENDIF posts.user.signature -->

		<small class="pull-right">
			<span class="post-tools">
				<a component="post/reply" href="#" class="btn btn-default no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">
					<i class="fa fa-reply" aria-hidden="true"></i> [[topic:reply]]
				</a>
				<a component="post/quote" href="#" class="btn btn-default no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">
					<i class="fa fa-quote-left" aria-hidden="true"></i> [[topic:quote]]
				</a>
			</span>

			<!-- IF !reputation:disabled -->
			<span class="votes">
				<a component="post/upvote" href="#" class="btn btn-info <!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
					<i class="fa fa-thumbs-up" aria-hidden="true"></i>
					&nbsp;<span class="badge" component="post/vote-count" data-votes="{posts.votes}">{posts.votes}</span>
				</a>

				<!-- IF !downvote:disabled -->
				<a component="post/downvote" href="#" class="<!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
					<i class="fa fa-thumbs-down" aria-hidden="true"></i>
				</a>
				<!-- ENDIF !downvote:disabled -->
			</span>
			<!-- ENDIF !reputation:disabled -->

			<!-- IMPORT partials/topic/post-menu.tpl -->
		</small>

		<!-- IF !hideReplies -->
		<a component="post/reply-count" href="#" class="threaded-replies no-select <!-- IF !posts.replies.count -->hidden<!-- ENDIF !posts.replies.count -->">
			<span component="post/reply-count/avatars" class="avatars <!-- IF posts.replies.hasMore -->hasMore<!-- ENDIF posts.replies.hasMore -->">
				<!-- BEGIN posts.replies.users -->
				<!-- IF posts.replies.users.picture -->
				<span><img component="user/picture" data-uid="{posts.replies.users.uid}" title="{posts.replies.users.username}" class="avatar" src="{posts.replies.users.picture}"  itemprop="image" /></span>
				<!-- ELSE -->
				<div component="user/picture" data-uid="{posts.replies.users.uid}" title="{posts.replies.users.username}" class="user-icon" style="background-color: {posts.replies.users.icon:bgColor};">{posts.replies.users.icon:text}</div>
				<!-- ENDIF posts.replies.users.picture -->
				<!-- END posts.replies.users -->
			</span>

			<span class="replies-count" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
			<span class="replies-last hidden-xs">[[topic:last_reply_time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>

			<i class="fa fa-fw fa-chevron-right" component="post/replies/open"></i>
			<i class="fa fa-fw fa-chevron-down hidden" component="post/replies/close"></i>
			<i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
		</a>
		<!-- ENDIF !hideReplies -->
	</div>
</div>
