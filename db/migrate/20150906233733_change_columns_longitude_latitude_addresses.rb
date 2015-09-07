class ChangeColumnsLongitudeLatitudeAddresses < ActiveRecord::Migration
  def change
    change_column :addresses, :longitude,  :float
    change_column :addresses, :latitude,  :float
  end
end
