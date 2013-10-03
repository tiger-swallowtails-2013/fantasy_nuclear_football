$("#button").on('click', function(event) {
  event.preventDefault()
  var data = {
    'pol_name': $('#pol_name').val()
  }
  $.post('/politicians/search', data, function(response){
    $("#politicianResults").html(response.join("<br>"));
  })
})


