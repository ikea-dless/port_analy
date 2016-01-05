ready = ->
  $('.special.cards .image').dimmer on: 'hover'

  if $(window).width() > 600
    $('body').visibility
      offset: -10
      observeChanges: false
      once: false
      continuous: false
      onTopPassed: () ->
        requestAnimationFrame () ->
          $('.following.bar')
            .addClass('light fixed')
            .find('.menu')
              .removeClass('inverted')
          $('.following .additional.item')
            .transition('scale in', 750)
      onTopPassedReverse: () ->
        requestAnimationFrame () ->
          $('.following.bar')
            .removeClass('light fixed')
            .find('.menu')
              .addClass('inverted')
              .find('.additional.item')
                .transition('hide')

$(document).ready(ready)
$(document).on('page:load', ready)