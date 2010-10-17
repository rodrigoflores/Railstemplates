$(function() {

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
		
		function UpdateStats(event, response) {
			var stats = $.parseJSON(response);
			$(".work").css({width: stats.working[1] + "%"}).attr("title", pluralize(stats.working[0], "vote", "votes"));
			$(".doesnt-work").css({width: stats.not_working[1] + "%"}).attr("title", pluralize(stats.not_working[0], "vote", "votes"));
		};
		
		$("#not_work_button[data-remote], #work_button[data-remote]")
			.bind('ajax:success', UpdateStats);
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
});