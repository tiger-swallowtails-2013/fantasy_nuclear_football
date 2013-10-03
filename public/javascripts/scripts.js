$("#button").on('click', function(event) {
  event.preventDefault()
  var data = {
    'pol_name': $('#pol_name').val()
  }
  $.post('/politicians/search', data, function(response){
    $("#politicianResults").html(response.join(''))
  })
})

;(function() {
  $(document).ready(function() {

    bindPoliticiansFilter()


  })

  function bindPoliticiansFilter() {
    $('#filterInput').keyup(function(e) {


      var newMatcher 
      try {
        newMatcher = new RegExp($(this).val(), 'i')
      } catch (e) {
        // do nothing
      }

      if (newMatcher) {
        showMatchedPoliticians(newMatcher)
      }
    })
  }

  function showMatchedPoliticians(matcher) {
    $('#availablePoliticians li').each(function() {

      var info = $(this)
      if (info.text().match(matcher)) {
        info.removeClass('hidden')
      }
      else {
        info.addClass('hidden')
      }
    })
  }
  
})()
