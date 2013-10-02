$("#button").on('click', function(event) {
  event.preventDefault()

  $.get('/politicians/search', function(response){

    //find out shit

    $("#politicianResults").replaceWith(response);
  })
})
