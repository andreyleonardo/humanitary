class AddressesController < ApplicationController  
  private
  def permited_params
    params.permit(address: [:zip, :activity, :longitude, :latitude])
  end
end
