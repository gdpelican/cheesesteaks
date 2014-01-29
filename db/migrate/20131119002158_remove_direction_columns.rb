class RemoveDirectionColumns < ActiveRecord::Migration
  def change
    remove_column :directions, :workshops_id
    remove_column :directions, :latitude
    remove_column :directions, :longitude
  end
end
