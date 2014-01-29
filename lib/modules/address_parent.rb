module AddressParent
   
  def create_address
    if self.new_address.present?
      address = Address.create! address: self.new_address, 
                                name: self.new_address_name, 
                                is_destination: address_is_destination
      self.address_id = address.id
    end  
  end

end
