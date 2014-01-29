class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :teacher
      t.belongs_to :workshop
      t.string :name
      t.string :description
      t.has_attached_file :picture
      
      t.timestamps
    end
  end
end
