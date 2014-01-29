# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  
  FAQs =
    master: $('.faqs')
    initialize: ->
       if !has('native-details')
        @.master.find('details').addClass('no-det')
        @.master.on 'click', 'details.no-det summary', ->
         _details = $(@).closest('details')
         if _details.attr('open') then _details.removeAttr('open') else _details.attr('open', 'open')
  
  FAQs.initialize()
  Cheesesteak.FAQs = FAQs