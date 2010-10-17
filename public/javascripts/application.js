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