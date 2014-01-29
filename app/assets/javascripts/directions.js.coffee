# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  
  Directions =
    master: $('.directions')
    initialize: ->
      $('.directions').on 'click', '.transit-mode-badge:not(.selected)', ->
        badges = Directions.master.find('.transit-mode-badge')
        
        $(@).toggleClass('selected')
        badges.removeClass('unselected');
        badges.not(@).removeClass('selected')
        
        this_list = Directions.master.find('.' + $(@).data('transit-mode')).parent()
        lists = Directions.master.find('.directions-list-item').not(this_list)
        
        count = lists.length - 1
        lists.hide ->
          count--
          if count == 0
            this_list.slideToggle()
  
  Directions.initialize()
  Cheesesteak.Directions = Directions