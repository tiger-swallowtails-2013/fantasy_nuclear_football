$('#update').on('click', function(event) {
  event.preventDefault()

  $('.notification').remove()
  $('.uhoh').remove()

  var data = {
    team_members: []
  }

  $('#team_members li').each(function() {
    data.team_members.push($(this).attr('rel'))
  })
  $.post(window.location.pathname, data, function(response){
     if(response==="okay"){
      $('#team_members').prepend('<p class="notification">Your team has been updated!</p>')
    }
    else if(response === "not okay"){
      $('#team_members').prepend('<p class="uhoh">Your team could not be updated at this time</p>')
    }
    else if(response === "error"){
      $('#team_members').prepend('<p class="uhoh">Something went wrong. Please rebuild your team</p>')
    }
    else{
      console.log("how did you get here?")
    }
  })
});

;(function() {
  $(document).ready(function() {

    bindPoliticiansFilter()
    bindSortableTeam()

  })

  function bindSortableTeam() {
    $('ul.sortable').sortable({

      connectWith: '.sortable'
    })

    $('#team_members ul').sortable({
      receive: function(event, ui) {
        $('#hidden li.' + ui.item[0].className).remove();
      }
    })

    $('#availablePoliticians ul').sortable({
      receive: function(event, ui) {
        var originalListPos = ui.item[0].className.split('pol-').slice(1)[0]

        if (originalListPos == 0) {
          $('#hidden ul').prepend($(ui.item[0]).clone())
        } else {
          $('#hidden li:eq(' + (originalListPos - 1) + ')').after($(ui.item[0]).clone())
        }
      }
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
    $('#availablePoliticians ul').html('')

    $('#hidden li').each(function() {
      var info = $(this)
      if (info.text().match(matcher)) {
        $('#availablePoliticians ul').append(info.clone())
      }
    })
  }

})()
