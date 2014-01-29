module WorkshopsHelper
  
    def featured_preview(obj, featured, tag = :li)
      field = obj.featured.send(featured) rescue nil
      return if field.nil?
                
      content_tag tag, (render partial: 'workshop_child/preview', locals: { obj: field }), class: 'frame'
    end
    
end
