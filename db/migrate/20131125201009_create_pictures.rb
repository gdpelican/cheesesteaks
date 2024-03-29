class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.belongs_to :workshop
      t.has_attached_file :picture
      t.timestamps
    end
  end
end
