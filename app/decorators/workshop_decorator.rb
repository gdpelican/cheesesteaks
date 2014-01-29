class WorkshopDecorator < Draper::Decorator
  delegate_all

  attr_accessor :fieldset
  
  def free_form
    true
  end

  def intro_message
    case status
      when :upcoming then "The #{year} Philadelphia Stage Combat Workshop is coming! Check back often for updates."
      when :announced then "The #{year} Philadelphia Stage Combat Workshop is scheduled for #{formatted_date}"
      when :current then "The #{year} Philadelphia Stage Combat Workshop is happening now!"
      when :happened then "Thanks to all who made the #{year} Philadelphia Stage Combat Workshop a blast. See you next year!"
    end
  end
  
  def is(*statuses)
    statuses.include? status
  end
  
  def status
    if(start_at.nil? || end_at.nil?)
      :upcoming
    elsif (DateTime.now < start_at)
      :announced
    elsif (DateTime.now < end_at)
      :happening
    else
      :happened
    end
  end
    
  def courses_with_blank
    object.courses.scheduled + [Course.new]
  end
  
  def teachers_with_blank
    object.teachers.uniq + [Teacher.new]
  end
  
  def pictures_with_blank
    object.pictures + [Picture.new]
  end
  
  def formatted_date
    start_at.strftime "%B #{start_at.day.ordinalize} - #{end_at.day.ordinalize}"
  end
  
  def fieldsets
    [:dates, :address, :courses, :teachers, :pictures]
  end

end
