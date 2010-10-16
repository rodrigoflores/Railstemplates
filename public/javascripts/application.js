var Application = {
  like: function() {
		$("#like_button")
			// .bind('ajax:success', function() { alert("deu certo");})
			// .bind('ajax:failure', function() { alert("deu errado");});
  }
};

$(document).ready( function() {
  Application.like();
});