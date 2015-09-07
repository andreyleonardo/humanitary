class AddGroupToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :group, index: true, foreign_key: true
  end
end
