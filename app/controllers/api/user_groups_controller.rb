class Api::UserGroupsController < ApplicationController
  before_action :authenticate_user
  def index
    @user_groups = UserGroup.where(id: current_user.id)
    render 'index.json.jbuilder'
  end

  def show
    @user_group = UserGroup.find_by(id: params[:id])
    if @user_group.user_id == current_user.id
      render 'show.json.jbuilder'
    else
      render json: {:errors => @user_group.errors.full_messages}, Status: :Unauthorized
    end
  end

  def create
    @user_group = UserGroup.new(
      user_id: current_user.id,
      group_id: params[:group_id]
    )
    if @user_group.save
      render 'show.json.jbuilder'
    else
      render json: {:errors => @user_group.errors.full_messages}, Status: :Bad_Request
    end
  end

  def update
    @current_user_group = UserGroup.find_by(id: current_user.id)
    @user_group = UserGroup.find_by(id: params[:id])
    if @user_group.user_id == current_user || (current_user.admin == true && @current_user_group.group_id == @user_group.group_id)
      @user_group.user_id = params[:user_id] || @user_group.user_id
      @user_group.group_id = params[:group_id] || @user_group.group_id
      if @user_group.save 
        render 'show.json.jbuilder'
      else
        render json: {:errors => @user_group.errors.full_messages}, Status: :Bad_Request
      end
    else
      render json: {:errors => @user_group.errors.full_messages}, Status: :Unauthorized
    end
  end
#possibly remove the above action
  def destroy
    @current_user_group = UserGroup.find_by(id: current_user.id)
    @user_group = UserGroup.find_by(id: params[:id])
    if @user_group.user_id == current_user || (current_user.admin == true && @current_user_group.group_id == @user_group.group_id)
      @user_group.destroy
      render json: {message: "this user group has been successfully deleted"}
    else
      render json: {:errors => @user_group.errors.full_messages}, Status: :Unauthorized
    end
  end
end
