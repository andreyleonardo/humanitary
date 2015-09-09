class Address < ActiveRecord::Base
  validates :zip, :activity, :longitude, :latitude, presence: true
  belongs_to :group
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  
  
  protected
  def self.approved_group
    self.select(:group_name, :group_description, :responsable_name, :group_phone).joins(:group).where(groups: {state: "received"})
  end  
end
