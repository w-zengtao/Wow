class AddContentToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :content, :string

    add_index :locations, :lonlat
  end
end
