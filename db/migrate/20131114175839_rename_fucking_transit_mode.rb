class RenameFuckingTransitMode < ActiveRecord::Migration
  def change
    rename_table :transit_mode, :transit_modes
  end
end
