class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :group_description
      t.string :responsable_name
      t.column :group_phone, :bigint
      t.timestamps null: false
    end
  end
end
