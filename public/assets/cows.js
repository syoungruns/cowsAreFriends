$('form').on('submit', function(e){
  if ($('input:checked').length != 10){
    e.preventDefault(); //wait, don't submit that form!
    //show error somehow
    alert('Looks like you missed a cowstion 😉').after;
  }
});
