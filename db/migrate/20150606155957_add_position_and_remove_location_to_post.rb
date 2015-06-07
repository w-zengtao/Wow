class AddPositionAndRemoveLocationToPost < ActiveRecord::Migration
  def change
    remove_column :posts, :location
    add_column :posts, :position, :string
  end
end
