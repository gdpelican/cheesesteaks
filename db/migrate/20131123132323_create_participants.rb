class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone

      t.decimal :amount_owed
      t.boolean :paid
    
      t.string :tshirt_type
      t.string :tshirt_size

      t.references :address
      t.belongs_to :workshop
      
      t.timestamps
    end
  end
end
