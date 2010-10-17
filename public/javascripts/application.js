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
	},
	commentaryCreation: function(){
	  $("#new_commentary")
	    .bind('ajax:success', function(rawResponse,msg) {
	      data = $.parseJSON(msg);
	      var div = $("<div />");
	      div.addClass('commentary')
	      author = $("<p><strong>" + data.author.githubber.name + "</strong></p>\n");
	      div.append(author)
	      commentary = $("<p>" + data.text + "</p>");
	      div.append(commentary);
	      alert(div.html());
	      $('#commentaries').append(div);
	    }).bind('ajax:failure', function(rawResponse, msg){
	      alert("Deu erro");
	    });
	}
};



var Html5 = {
	placeholder: function() {
		$("input[placeholder]").placeholder();
	}
}

$(function() {
	Application.remotes();
	Html5.placeholder();
	Application.commentaryCreation();
});