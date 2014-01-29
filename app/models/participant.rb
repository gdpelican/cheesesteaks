class Participant < ActiveRecord::Base
  
  has_one :address
  
  def self.mass_fields
    [:first_name, :last_name, :address, :telephone, :email, :amount_owed, :tshirt, :paid]
  end
end
