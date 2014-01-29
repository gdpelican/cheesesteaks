require 'modules/address_parent'
class Direction < ActiveRecord::Base
  include AddressParent
  
  scope :addresses, -> { joins(:address) }
  
  belongs_to :address
  belongs_to :transit_mode

  before_validation :create_address  
  attr_accessor :new_address
  attr_accessor :new_address_name
  
  validates_presence_of :destination_id
  validates_presence_of :address_id
  validates_presence_of :transit_mode_id
    
  def address_is_destination
    false
  end
  
  def self.mass_fields
    [:directions, :address_id, :transit_mode_id, :destination_id, :new_address, :new_address_name]
  end
  
end