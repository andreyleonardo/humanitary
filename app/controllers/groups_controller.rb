class GroupsController < ApplicationController  
  def create_group
    @group = Group.new(permited_params_create_group)
    flag=@group.save   
    if flag
      # render json: {group: @group, addresses: @group.addresses}, status: :ok
      render json: {status: flag}, status: 200
    else
      render json: {status: "thuglife13 stole a param from you."}, status: 404
    end
  end
  
  def near_groups
    user = User.new(permited_params_near_groups) #Used only for tests.
    nearby = Address.approved_group.near([user.latitude, user.longitude], 1, :units => :km)
    if !nearby.empty?
      render json: {nearby: nearby}, status: :ok
    else
      render json: {status: "thuglife13 is not close."}, status: :ok
    end
  end
  
  private
  def permited_params_create_group
    params.require(:group).permit(:group_name, :group_description, :responsable_name, :group_phone, :group_description, addresses_attributes:[:address, :zip, :activity, :longitude, :latitude])
  end
  
  def permited_params_near_groups
    params.require(:near_groups).permit(:fb_user_id, :fb_access_token, :latitude, :longitude)
  end
end
