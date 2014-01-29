require 'modules/address_parent'
class Workshop < ActiveRecord::Base
  include AddressParent
  
  default_scope { order('"year" DESC') }
  scope :past, -> { offset(1) } 
  scope :scheduled_courses, -> { joins(:courses) & Course.scheduled }
    
  validates_presence_of :year
  
  after_initialize :init_featured
  before_save :create_address
  before_save :create_featured
  
  attr_accessor :new_address, :new_address_name
  attr_accessor :featured_picture_id, :featured_teacher_id, :featured_course_id
  
  belongs_to :address
  has_one :featured
  
  has_many :directions
  has_many :participants
  
  has_many :courses, dependent: :destroy, before_add: :set_parent
  has_many :pictures, dependent: :destroy, before_add: :set_parent
  has_many :teachers, through: :courses
  
  accepts_nested_attributes_for :courses,  reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :teachers, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true 
    
  def set_parent(child)
    child.workshop = self
  end
  
  def init_featured
    self.featured = Featured.new if self.featured.nil?
    self.featured_course_id = self.featured.course_id
    self.featured_teacher_id = self.featured.teacher_id
    self.featured_picture_id = self.featured.picture_id
  end
  
  def create_featured
    self.featured.update_attributes({ workshop_id:  self.id,
                                      picture_id:   self.featured_picture_id,
                                      teacher_id:   self.featured_teacher_id,
                                      course_id:    self.featured_course_id })
    self.featured.save! if self.featured.changed?
  end
  
  def scheduled_courses
    courses.select {|course| course.name.present? }
  end
  
  def premium_courses
    courses.select {|course| course.cost > 0 } 
  end
  
  def address_is_destination
    true
  end
    
  def self.find_by_year(year)
    case year
      when nil then nil
      when 'current' then current
      else where(year: year).first
    end
  end
  
  def self.current
    order('"year" DESC').first
  end
  
  def self.mass_fields
    [:start_at, 
      :end_at, 
      :address_id, 
      :new_address, 
      :new_address_name, 
      :featured_picture_id, 
      :featured_teacher_id, 
      :featured_course_id,
      courses_attributes: Course.mass_fields,
      teachers_attributes: Teacher.mass_fields,
      pictures_attributes: Picture.mass_fields]
  end
  
end