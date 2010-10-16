var Application = {
  // like: function() {
  //    $("#like_button")
  //      .bind('ajax:success', function() { alert("deu certo");})
  //      .bind('ajax:failure', function() { alert("deu errado");});
  // },
  // work: function() {
  //    $("#work_button")
  //      .bind('ajax:success', function() { alert("deu certo");})
  //      .bind('ajax:failure', function() { alert("deu errado");});
  // }
};

var Templates = {
	preview: function() {
		var sample = $("#sample[data-url]");
		if(sample.size()) {
			$.getJSON("http://jsonproxy.heroku.com/fetch?path=" + sample.attr("data-url") + "&callback=?", function(response) {
				var preview = $("<code class='prettyprint />");
				sample.append(preview.html(response.content.replace(/\n/ig, '<br />')));
				prettyPrint();
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
	Templates.preview();
	Html5.placeholder();
  // Application.like();
  // Application.work();  
});