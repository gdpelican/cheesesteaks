class Course < ActiveRecord::Base
  
  scheduled = arel_table[:name].eq(nil).not
  scope :has_teacher, ->(teacher) { where(teacher_id: teacher.id) }
  scope :scheduled, -> { where(scheduled) }
  scope :unscheduled, -> { where(scheduled.not) }
  scope :premium_courses, ->(workshop) { scheduled.where(workshop_id: workshop.id).where('cost > ?', 0) }
        
  belongs_to :workshop
  belongs_to :teacher
  
  alias_attribute :avatar, :picture
  alias_attribute :full_name, :description
  
  validates_presence_of :workshop_id
  validates_presence_of :teacher
  
  has_attached_file :picture,
   :styles => {
     :original => "500x500#",
     :preview  => "150x150#",
     :thumb => "100x100#"},
   :storage => :s3,
   :default_url => 'missing_course.png',
   :s3_credentials => "#{Rails.root}/config/s3.yml",
   :path => "/courses/:style/:id/:filename",
   :bucket => 'TheCheeseSteaks'
  
  def has_image?
    picture.present?
  end
  
  def in_workshop(workshop)
    if workshop then self.workshop.id == workshop.id end
  end
    
  def self.in_workshop(workshop = nil)
    (workshop.present?) ? where(workshop_id: workshop.id) : all
  end
  
  def self.unscheduled_class(teacher, workshop)
    has_teacher(teacher).in_workshop(workshop).unscheduled
  end
    
  def self.mass_fields
    [:id, :name, :description, :picture, :workshop_id, :teacher_id, :_destroy]
  end
end