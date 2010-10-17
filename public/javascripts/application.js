var Application = {
	remotes: function() {
		onSuccess = function(){
			// ul > li > table > tbody > tr > td WTF
		  $(this).parents("li").fadeOut(function() {
	      $(this).remove();
	      
	      if($('#my-templates li').length <= 0) {
  		    $('#my-templates').fadeOut(function() {
  		      $(this).remove();
  		      
  		      if($("#left .textbox").length <= 1) {
              $('#getting-started').fadeIn();
      		  }
  		    });
  		  }
	    });
		$(".delete-template")
			.bind('ajax:success', onSuccess);
		  $('.unlike-template').bind('ajax:success', function() {
  		  $(this).parents("li").fadeOut(function() {
  	      $(this).remove();

  	      if($('#liked li').length <= 0) {
    		    $('#liked').fadeOut(function() {
    		      $(this).remove();

    		      if($("#left .textbox").length <= 1) {
                $('#getting-started').fadeIn();
        		  }
    		    });
    		  }
  	    });
  	  });
  		$(".delete-template").bind('ajax:success', onSuccess);
		}
	},
	commentaryCreation: function(){
	  $("#new_commentary")
	    .bind('ajax:success', function(rawResponse,msg) {
	      data = $.parseJSON(msg);
				$("#commentary_commentary").removeClass("error").val("");
	      var div = $("<div />").addClass('commentary').css("display", "none");
	      div.append($("<p><strong>" + data.author.githubber.name + "</strong></p>"));
	      div.append("<p>" + data.text + "</p>");

	      $('#commentaries').prepend(div);
				div.slideDown();
	    }).bind('ajax:failure', function(rawResponse, msg){
				$("#commentary_commentary").addClass("error");
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