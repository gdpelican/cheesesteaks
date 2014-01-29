module ApplicationHelper
  def font_icon(code)
    "<i class=\"flaticon-#{code}\"></i>".html_safe
  end
  
  def date_format(date, format = '%d/%m/%Y')
    return if date.nil?
    date.strftime(format)
  end
  
  def stringify_class(obj)
    obj.class.to_s.downcase.gsub('decorator', '')
  end
  
  def list_for(collection, options = {})
    content_tag :ul, class: "#{options[:ul_class]} site-collection#{' authed' if @authed}" do
      collection.each do |value|
        concat(content_tag :li, value, class: options[:li_class])
      end
    end
  end
  
  def list_for_view(collection, options = {})
    return if collection.empty?
    list_for collection.map { |obj| render(partial: get_view(options[:obj_type] || collection.first.class, options[:view]), locals: { obj: obj }) }, options
  end
  
  def google_maps_script
    content_tag :script, type: 'text/javascript', src: google_maps_src do
    end if @use_maps
  end
  
  private
  
  def get_view(obj, action)
    obj.to_s.pluralize.downcase + '/' + (action || 'show')
  end
  
  def google_maps_src
    "http://maps.googleapis.com/maps/api/js?sensor=false"
  end
  
end
