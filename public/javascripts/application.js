var Application = {
  like: function() {
    $('#like-this-template').click( function(){
      link = $(this);
      $.ajax({
        url: link.attr('href'),
        type: 'PUT',
        success: function(){
          alert("Deu certo");
        },
        error: function() {
          alert("Deu errado");
        }
        
      })
      return false;
    });
  }
}



$(document).ready( function() {
  Application.like();
});