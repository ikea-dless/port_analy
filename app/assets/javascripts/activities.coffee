ready = ->
  elem = $('#ac')
  if elem[0]
    elem.addClass('loading')
    $.getJSON("/api/activities/#{location.href.match(/\d*$/)}", (datam) ->
      if datam[0]
        $('.ui.container').append('<div class="ui styled fluid accordion" id="dic">')
        for key, value of datam
          $('#dic').append("<div class=\"title\"><i class=\"dropdown icon\"></i>#{value.word} とは？</div><div class=\"content\"><p class=\"transition hidden\">#{value.introduction}</p></div>")
        $('.ui.accordion').accordion()
        elem.removeClass('loading')
    )

$(document).ready(ready)
$(document).on('page:load', ready)