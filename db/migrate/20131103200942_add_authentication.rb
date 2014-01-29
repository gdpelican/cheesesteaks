class AddAuthentication < ActiveRecord::Migration
  def change
    drop_table :people
    create_table :admin do |t|
      t.string :name
      t.string :salt
      t.string :pass_hash
      t.string :email
      t.timestamps
    end
    
    drop_table :sessions
    create_table :sessions do |t|
      t.belongs_to :admin
      t.timestamps
    end
  end
end