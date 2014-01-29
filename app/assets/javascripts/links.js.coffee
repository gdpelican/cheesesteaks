$(document).on 'click', 'nav.links', (event) -> 
  $(this).find('ul').toggleClass('visible')
  
$(document).on 'click', 'nav.links>ul', (event) ->
  event.stopPropagation()