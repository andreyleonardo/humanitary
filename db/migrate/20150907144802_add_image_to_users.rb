class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_index :users, :image
  end
end
