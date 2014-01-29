class IBrokeWorkshop < ActiveRecord::Migration
  def change
    drop_table :workshops
    create_table :workshops do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :address
      t.integer :year
      t.timestamps
    end
  end
end
