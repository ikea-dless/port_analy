ready = ->
  $('.special.cards .image').dimmer on: 'hover'

$(document).ready(ready)
$(document).on('page:load', ready)