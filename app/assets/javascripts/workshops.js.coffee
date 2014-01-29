$ ->
  
  Workshop =
    master: $('form.workshop')
    initialize: (start, end, address, lat, lng) ->
      @Dates.initialize start, end
      @Address.initialize lat, lng, address
      @Children.initialize()      
    
    Dates:
      initialize: (start, end) ->
        picker = $('.workshops form').find('.datepicker')
        year = picker.data('year')
        @.prevDay = new Date($.datepicker.formatDate('dd/mm/yy', new Date(start.val())))
        @.currDay = new Date($.datepicker.formatDate('dd/mm/yy', new Date(end.val())))
        
        picker.datepicker({
          maxDate:     new Date(year, 11, 31), \
          minDate:     new Date(year, 0, 1), \
          hideIfNoPrevNext: true, \
          beforeShowDay: (date) =>
            if @.low() <= date.getTime() <= @.high()
              [true, 'date-range-selected']
            else
              [true, '']
            
          onSelect: (dateText, selected) =>
            newDate = (new Date(selected.selectedYear, selected.selectedMonth, selected.selectedDay)).getTime()
            if @.prevDay == @.currDay
              @.currDay = newDate
            else
              @.prevDay = @.currDay = newDate
  
            if(@.prevDay == -1 || @.prevDay == @.currDay)
              fromText = dateText
              toText = ''
            else
              fromText = $.datepicker.formatDate('dd/mm/yy', new Date(@.low()))
              toText = $.datepicker.formatDate('dd/mm/yy', new Date(@.high()))
            start.val(fromText)
            end.val(toText)
        }).datepicker('setDate', @.prevDay)
          
      prevDay: -1
      currDay: -1
      
      low: ->
        Math.min(@.prevDay, @.currDay)
      high: ->
        Math.max(@.prevDay, @.currDay)
    
    Address:
      initialize: (lat, lng, address) ->
        @mapDiv = document.getElementById('address-map')
        if @mapDiv?
          @setPosition lat.val(), lng.val()
          @mapOptions =
            zoom: 15
            center: @latLng
          Workshop.master.on 'change', 'select[data-field=address_id]', ->
            $.ajax
              type: 'GET'
              url: '/address/' + address.val()
              dataType: 'json'
              success: (json) -> Cheesesteak.Forms.Workshop.Address.updateMap json.latitude, json.longitude
      showMap: ->
        if not @map?
          @map = new google.maps.Map @mapDiv, @mapOptions
          @marker = new google.maps.Marker
            position: @latLng
            map: @map
            title: 'The Cheesesteaks!'
      updateMap: (lat, lng) ->
        @setPosition lat, lng
        @marker.setPosition @latLng
        @map.panTo @latLng
      setPosition: (lat, lng) ->
        @latLng = new google.maps.LatLng lat, lng
    
    Children:
      initialize: ->
        Workshop.master.on 'click', '.child-select', ->
          self = $(@)
          selected = self.closest('.inputs').find('[data-id=' + self.data('value') + ']')
          siblings = self.siblings('.child-select')
            
          self.addClass('selected')
          siblings.removeClass('selected')
          
          selected.slideDown()
          selected.siblings('.child-form').slideUp()
        Workshop.master.on 'click', '.destroy-trigger', (e) ->
          e.stopPropagation()
          self = $(@)
          target = self.closest('.children') \
                       .find('.child-form[data-id=' + self.parent().data('value') + ']') \
                       .find('input[data-field=_destroy]')
          
          self.parent().toggleClass 'delete-mark'
          target.val (target.val() == 'false') ? 'true' : 'false'
          
        Workshop.master.find('.inputs').each ->
          $(@).find('.child-select').first().click()
    
  Workshop.initialize($('input[data-field=start_at]'),
                      $('input[data-field=end_at]'),
                      $('select[data-field=address_id]'),
                      $('input[data-field=latitude]'),
                      $('input[data-field=longitude]'))
                        
  Cheesesteak.Forms = {} unless Cheesesteak.Forms?
  Cheesesteak.Forms.Workshop = Workshop