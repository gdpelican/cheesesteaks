class Picture < ActiveRecord::Base
  
  belongs_to :workshop
    
  has_attached_file :picture,
   :styles => {
     :original => "1024x1024",
     :preview => "300x300#",
     :thumb  => "100x100#"},
   :storage => :s3,
   :default_url => 'missing_picture.png',
   :s3_credentials => "#{Rails.root}/config/s3.yml",
   :path => "/courses/:style/:id/:filename",
   :bucket => 'TheCheeseSteaks'
   
  def has_image?
    true
  end
  
  def name
    self.picture.url
  end
   
  def self.mass_fields
    [:id, :picture, :_destroy]
  end
   
end