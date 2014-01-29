class AddDestinations < ActiveRecord::Migration
  def change
    remove_column :directions, :workshop_id
    add_column :addresses, :is_destination, :boolean, default: true
  end
end
