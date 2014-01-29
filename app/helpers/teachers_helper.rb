module TeachersHelper
  def teacher_course_links(courses)
      courses = courses.map{|course| course_link(course) }
      list_for courses, ul_class: 'courses' if courses.any?
  end
  
  private
  
  def course_link(course)
    link_to("#{course.name} (#{course.workshop.year})", workshop_course_path(course.workshop, course.id))
  end
end
