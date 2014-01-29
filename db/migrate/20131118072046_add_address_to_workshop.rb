class AddAddressToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :address_id, :integer
  end
end
