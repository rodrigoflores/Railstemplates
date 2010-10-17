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
			response = $.parseJSON(response);
			$(".work").css({width: response[0] + "%"});
			$(".doesnt-work").css({width: response[1] + "%"});
		};
		
		$("#not_work_button[data-remote], #work_button[data-remote]")
			.bind('ajax:success', UpdateStats);
	}


	highlight();
	workingStatus();
});