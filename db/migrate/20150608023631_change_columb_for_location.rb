class ChangeColumbForLocation < ActiveRecord::Migration
  def change
    # change_column :locations, :position, :st_point, :geographic => true
    remove_column :locations, :position

    add_column :locations, :lonlat, :st_point, :geographic => true
  end
end
