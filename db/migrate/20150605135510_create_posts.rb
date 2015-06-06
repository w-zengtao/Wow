class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.point :location, :geographic => true
      t.text :content
      t.string :photo
      t.string :position
      t.integer :user_id

      t.timestamps null: false
    end
  # add_index :posts, :location, using: :gin
  end
end
