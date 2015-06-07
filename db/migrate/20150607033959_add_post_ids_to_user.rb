class AddPostIdsToUser < ActiveRecord::Migration
  def change
    add_column :users, :post_ids, :integer, array: true,  null: false, default: []
  end
end
