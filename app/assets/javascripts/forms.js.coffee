# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
   
  Forms =   
    multipage: $('form.multi-page')
    initialize: ->
      $('form').on 'click', '.toggle-trigger', ->
        $($(@).data('toggle')).slideToggle()
      
      @multipage.on 'click', '.fieldset-trigger', ->
        Forms.openFieldset $(@).data('inputs')
           
     openFieldset: (name) ->
       link = Forms.multipage.find('.form-sets>li[data-inputs=' + name + ']')
       form = Forms.multipage.find('fieldset.inputs[data-inputs=' + name + ']')
         
       if !link.hasClass('selected')
         Forms.multipage.find('input[name=fieldset]').val(name)      

         link.addClass('selected')
         link.siblings().removeClass('selected')
         
         addressCallback = -> 
          if name == 'address' then Cheesesteak.Forms.Workshop.Address.showMap()
         
         form.show addressCallback
         form.siblings('fieldset.inputs').hide()
      
     
  Cheesesteak.Forms = Forms
  Cheesesteak.Forms.initialize()
