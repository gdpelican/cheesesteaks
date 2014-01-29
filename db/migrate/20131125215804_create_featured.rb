class CreateFeatured < ActiveRecord::Migration
  def change
    create_table :featured do |t|
      t.references :workshop
      t.references :teacher
      t.references :course
      t.references :picture
    end
  end
end
