class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :os
      t.string :version
      t.string :device_token

      t.timestamps null: false
    end
  end
end
