$('#update').on('click', function(event) {
  event.preventDefault()
  var data=$('#team_members li')

  $.post(window.location.pathname, data, function(response){
     if(response==="okay"){
      $('#team_members').prepend('<p class="notification">Your team has been updated!</p>')
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
