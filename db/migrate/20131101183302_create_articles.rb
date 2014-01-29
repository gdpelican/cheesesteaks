class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      
      t.has_attached_file :picture
      t.string :caption
      
      t.timestamps
    end
  end
end
