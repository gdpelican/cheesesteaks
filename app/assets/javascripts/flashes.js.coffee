$ ->
  Flashes =
    initialize: ->
      if $('#notice').is(':not(:empty)') then @notice()
      if $('#error').is( ':not(:empty)') then @error()
          
    error: (message)->
      @flash($('#error'), message)
    notice: (message)->
      @flash($('#notice'), message)
      
    flash: (el, message, speed = 1000, delay = 2500) ->
      if(message) then el.html(message)
      el.fadeIn speed, ->
        setTimeout (-> el.fadeOut(speed)), delay
    
  Cheesesteak.Flashes = Flashes
  Cheesesteak.Flashes.initialize()
