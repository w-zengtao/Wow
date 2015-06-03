class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :encrypted_password

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
