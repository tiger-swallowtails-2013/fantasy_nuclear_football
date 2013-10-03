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
    bindSortableTeam()

  })
  function bindSortableTeam() {
    $('ul.sortable').sortable({

      connectWith: '.sortable'
    })
  }

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
    // $('#availablePoliticians ul').html('')

    // $('#hidden li').each(function() {
    //   var info = $(this)
    //   if (info.text().match(matcher)) {
    //     $('#availablePoliticians ul').append(info.clone())
    //   }
    // })

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
