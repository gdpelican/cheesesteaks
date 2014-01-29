class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.has_attached_file :avatar
      
      t.timestamps
    end
  end
end
