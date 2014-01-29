class UpdateWorkshop < ActiveRecord::Migration
  def change  
    remove_column :workshops, :id
    add_column :workshops, :year, :integer, options: 'PRIMARY KEY'
  end
end
