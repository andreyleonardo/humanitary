class GroupsController < ApplicationController  
  def create_group
    @group = Group.new(permited_params_create_group)
    flag=@group.save   
    if flag
      # render json: {group: @group, addresses: @group.addresses}, status: :ok
      render json: {status: flag}, status: 200
    else
      render json: {status: "A param is missing"}, status: 404
    end
  end
  
  def near_groups
    user = User.new(permited_params_near_groups)
    nearby = Address.near([user.latitude, user.longitude], 1, :units => :km)
    if !nearby.empty?
      render json: {nearby: nearby}, status: :ok
    else
      render json: {status: "no groups nearby"}, status: :ok
    end
  end
  
  private
  def permited_params_create_group
    params.require(:group).permit(:group_name, :group_description, :responsable_name, :group_phone, :group_description, :state, addresses_attributes:[:address, :zip, :activity, :longitude, :latitude])
  end
  
  def permited_params_near_groups
    params.require(:near_groups).permit(:fb_user_id, :fb_access_token, :latitude, :longitude)
  end
end
