class CreateFeatureds < ActiveRecord::Migration
  def change
    drop_table :featured
    create_table :featureds do |t|
      t.references :workshop
      t.references :teacher
      t.references :course
      t.references :picture
    end
  end
end
