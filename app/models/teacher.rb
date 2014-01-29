class Teacher < ActiveRecord::Base
    
  has_many :courses
  has_many :workshops, through: :courses
  
  before_validation :handle_existing
  
  has_attached_file :avatar,
     :styles => {
       :original => "500x500#",
       :preview  => "150x150#",
       :thumb => "100x100#" },
     :storage => :s3,
     :default_url => 'missing_teacher.png',
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/teachers/:style/:id/:filename",
     :bucket => 'TheCheeseSteaks'
     
  validates_presence_of :first_name
  validates_presence_of :last_name 
  
  alias_attribute :name, :full_name
  alias_attribute :picture, :avatar
  
  attr_accessor :existing_teacher_id, :existing_workshop_id
  
  def has_image?
    avatar.present?
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def recent_courses
    courses.reject {|course| course.name.blank?}.first(2)
  end
 
  def in_workshop(workshop)
    if workshop then courses.select { |course| course.workshop_id == workshop.id }.count > 0 end
  end
  
  def self.not_in_workshop(workshop)
    (workshop) ? joins(:courses).where.not(courses: { workshop_id: workshop.id}).uniq : []
  end 
 
  def self.in_workshop(workshop)
    (workshop) ? joins(:courses).where(courses: { workshop_id: workshop.id }).uniq : all
  end
  
  def self.mass_fields
    [:id, :first_name, :last_name, :bio, :picture, :existing_teacher_id, :_destroy]
  end
  
  private
  
  def handle_existing
    return unless existing_teacher_id and existing_workshop_id
    Teacher.find(existing_teacher_id).workshops.push(Workshop.find_by_year(existing_workshop_id)).save
    false
  end 
  
end