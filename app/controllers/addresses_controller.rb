class AddressesController < ApplicationController
  belongs_to :group
  
  private
  def permited_params
    params.permit(address: [:zip, :activity, :longitude, :latitude])
  end
end
