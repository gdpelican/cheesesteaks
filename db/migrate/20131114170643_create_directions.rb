class CreateDirections < ActiveRecord::Migration
  def change
    remove_column :workshops, :address
    
    create_table :addresses do |t|
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
    end
          
    create_table :transit_mode do |t|
      t.string :name
    end
    
    create_table :directions do |t|
      t.decimal    :latitude
      t.decimal    :longitude
      t.text       :directions
      t.integer    :address_id
      t.integer    :transit_mode_id
      t.belongs_to :workshops

      t.timestamps
    end
    
  end
end
