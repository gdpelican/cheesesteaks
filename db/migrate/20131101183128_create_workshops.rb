class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :address
      
      t.timestamps
    end
  end
end