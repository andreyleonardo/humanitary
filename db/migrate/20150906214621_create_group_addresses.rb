class CreateGroupAddresses < ActiveRecord::Migration
  def change
    create_table :group_addresses, id: false, force: true do |t|
      t.integer :address_id
      t.integer :group_id
    end
  end
end
