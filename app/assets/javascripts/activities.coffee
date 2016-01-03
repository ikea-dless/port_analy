ready = ->
  elem = $('#ac')
  if elem[0]
    elem.addClass('loading')
    $.getJSON("/api/activities/#{location.href.match(/\d*$/)}", (datam) ->
      $('.ui.container').append('<div class="ui styled fluid accordion" id="dic">')
      elem.removeClass('loading')
      for key, value of datam
        console.log value.introduction
        $('#dic').append("<div class=\"title\"><i class=\"dropdown icon\"></i>#{value.word} とは？</div><div class=\"content\"><p class=\"transition hidden\">#{value.introduction}</p></div>")
      $('.ui.accordion').accordion()
    )

$(document).ready(ready)
$(document).on('page:load', ready)