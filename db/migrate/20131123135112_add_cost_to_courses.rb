class AddCostToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :cost, :decimal, default: 0
  end
end
