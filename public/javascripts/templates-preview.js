$(function() {
	function copy() {
		var link = $("#downloads a");
		var notice = $("#downloads span.notice");
		var normalize = function() {
			notice.fadeOut(function() { link.fadeIn(); });
		};

		var onCopied = function() {
			link.fadeOut(function() {
				notice.fadeIn(function() {
					setTimeout(normalize, 1000);
				});
			});
		};
		
		ZeroClipboard.moviePath = '/swf/ZeroClipboard.swf';
		clip = new ZeroClipboard.Client();
		clip.setHandCursor(true);
		clip.addEventListener('complete', onCopied);
		clip.setText(link.text());
		clip.glue('d_clip_button');
	}

	function highlight() {
		var sample = $("#source_code[data-url]");

		if(sample.size()) {
			$.getJSON("http://jsonproxy.heroku.com/fetch?path=" + sample.attr("data-url") + "&callback=?", function(response) {
				var preview = $("<code class='prettyprint' />");
				sample.append(preview.html(response.content.replace(/\n/ig, '<br />')));
				prettyPrint();
				sample.removeClass("loading");
			});
		}
	};

	function workingStatus() {

		var elements = $("#not_work_button[data-remote], #work_button[data-remote]"),
				loader   = $("#working_status .holder-content img");

		function UpdateStats(event, response) {
			var stats = $.parseJSON(response);
			$(".work").css({width: stats.working[1] + "%"}).attr("title", pluralize(stats.working[0], "vote", "votes"));
			$(".doesnt-work").css({width: stats.not_working[1] + "%"}).attr("title", pluralize(stats.not_working[0], "vote", "votes"));
			elements.attr("href", "javascript:;");
		};

		elements.bind('ajax:success', UpdateStats).bind('ajax:loading',
		function() {
		    loader.show();
		}).bind('ajax:complete',
		function() {
		    loader.hide();
		});
	}

	function likeStatus() {

		function UpdateLikeStatus(event, response) {
			response = $.parseJSON(response);

			$(this).parent().fadeOut(function() {
				$(this).remove();
			});

			$("#likes p").fadeOut(function() {
				$(this).text(response.status).fadeIn();
			});
		}

		$("#like_button[data-remote]")
			.bind('ajax:success', UpdateLikeStatus);
	}

	function pluralize(count, singular, plural) {
		return count + " " + (count == 1 ? singular : plural);
	}

	highlight();
	likeStatus();
	workingStatus();
	copy();
});