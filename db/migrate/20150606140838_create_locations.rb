class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.point :position, :geographic => true

      t.timestamps null: false
    end
  end
end
