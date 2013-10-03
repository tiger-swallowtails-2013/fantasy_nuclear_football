$(".button").on('click', function(event) {
  event.preventDefault()
  var data = {
    'pol_name': $('#pol_name').val()
  }
  $.post('/politicians/search', data, function(response){

    // console.log(response)
    $("#politicianResults").replaceWith(response.join("<br>"));
  })
})


