class AddDestinationToDirection < ActiveRecord::Migration
  def change
    add_column :directions, :destination_id, :integer
  end
end
