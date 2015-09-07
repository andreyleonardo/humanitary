class Address < ActiveRecord::Base
  validates :zip, :activity, :longitude, :latitude, presence: true
  belongs_to :group
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
end
