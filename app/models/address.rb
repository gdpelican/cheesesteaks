class Address < ActiveRecord::Base

  scope :origins, -> { where(is_destination: false) }
  scope :destinations, -> { where(is_destination: true) }
  
  geocoded_by :address
  after_validation :geocode
  
  def self.mass_fields
    [:address, :name, :is_destination]
  end

end
