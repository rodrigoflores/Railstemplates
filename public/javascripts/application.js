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
	    .bind('ajax:loading', function(rawResponse, msg) {
	      $("#commentaries .notice").fadeOut('fast');
	      $("#commentaries").parent().find('.error').remove();
	      $("#commentaries .buttons input").hide();
	      $('#commit-button').addClass('loading');
	    })
	    
	    .bind('ajax:complete', function(rawResponse) {
	      $("#commentaries .buttons input").show();
	      $('#commit-button').removeClass('loading');
	    })
	    
	    .bind('ajax:success', function(rawResponse,msg) {
	      var div = $("<div />").addClass('commentary').css("display", "none").html(msg);
	      $('.comments-list').prepend(div);
	      $('#commentary_commentary').val('');
				div.slideDown();
	    }).bind('ajax:failure', function(rawResponse, msg){
				$("#commentaries .buttons li input").after($("<div />").text("This comment is not valid!").addClass('error'));
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