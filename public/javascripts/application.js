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
		};
		
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
};



var Html5 = {
	placeholder: function() {
		$("input[placeholder]").placeholder();
	}
}

$(function() {
	Application.remotes();
	Html5.placeholder();
});