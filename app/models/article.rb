class Article < ActiveRecord::Base
    
  belongs_to :workshop
  
  validates_presence_of :title
  validates_presence_of :body
  
  def self.mass_fields
    [:title, :body, :picture, :caption, :workshop_id]
  end
  
end
