var Application = {
	remotes: function() {
		onSuccess = function(){
			// ul > li > table > tbody > tr > td WTF
			$(this).parents("li").fadeOut(function() {
				$(this).remove();
			})
		};

		$(".delete-template")
			.bind('ajax:success', onSuccess);
	}
  // like: function() {
  //    $("#like_button")
  //      .bind('ajax:success', function() { alert("deu certo");})
  //      .bind('ajax:failure', function() { alert("deu errado");});
  // },
};

var Templates = {
	preview: function() {
		var sample = $("#source_code[data-url]");

		if(sample.size()) {
			$.getJSON("http://jsonproxy.heroku.com/fetch?path=" + sample.attr("data-url") + "&callback=?", function(response) {
				var preview = $("<code class='prettyprint' />");
				sample.append(preview.html(response.content.replace(/\n/ig, '<br />')));
				prettyPrint();
				sample.removeClass("loading");
			});
		}
	}
}

var Html5 = {
	placeholder: function() {
		$("input[placeholder]").placeholder();
	}
}

$(function() {
	Application.remotes();
	Templates.preview();
	Html5.placeholder();
  // Application.like();
  // Application.work();
});