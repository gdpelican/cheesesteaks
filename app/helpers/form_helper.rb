module FormHelper
  
  def form_view(name, free_form = true)
    content_tag :li, '', class: "#{'fieldset-trigger' if free_form}", data: { inputs: "#{name}" } do
      content_tag :div, '', class: "flaticon-#{name}"
    end
  end
  
  def toggle_trigger(toggles, icon = 'swap')
    link_to font_icon(icon), 'javascript:;', class: 'toggle-trigger', data: { toggle: toggles.join(', ') }
  end
  
  def workshop_datepicker(year, from, to)
      content_tag :div, '', class: 'datepicker', data: { year: year, from: "#{from}", to: "#{to}" }
  end
  
  def collection_select(form, symbol, collection, options = {})
    return if collection.nil? || collection.empty?
    form.input symbol, 
               as: :select,
               collection: collection.map { |obj| [obj.name, obj.id ] },
               selected: options[:selected],
               label: options[:label] || symbol,
               input_html: { data: { field: symbol } },
               wrapper_html: { class: options[:wrapper_class] },
               include_blank: options[:include_blank] || false
  end
  
  def step_link(index, name)
    link_to "Go To Step #{index}", 'javascript:;', class: 'button fixed-button fieldset-trigger', data: { inputs: name }
  end
  
end