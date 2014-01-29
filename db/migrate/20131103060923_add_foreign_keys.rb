class AddForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key :courses, :workshops
    add_foreign_key :courses, :workshops, primary_key: 'year'
    
    remove_foreign_key :articles, :workshops
    add_foreign_key :articles, :workshops, primary_key: 'year'
  end
end
