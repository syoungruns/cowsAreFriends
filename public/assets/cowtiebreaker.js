$('form').on('submit', function(t){
  if ($('input:checked').length != 1){
    t.preventDefault();
    alert('You gotta break the tie!').after;
  }
});
