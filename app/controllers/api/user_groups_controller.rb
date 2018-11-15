class Api::UserGroupsController < ApplicationController
  def index
    @user_groups = UserGroup.all
    render 'index.json.jbuilder'
  end

  def show
    @user_group = UserGroup.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @user_group = UserGroup.new(
      user_id: params[:user_id],
      group_id: params[:group_id]
    )
    if @user_group.save
      render 'show.json.jbuilder'
    else
      render json: {}
    end
  end

  def update
    @user_group = UserGroup.find_by(id: params[:id])
    @user_group.user_id = params[:user_id] || @user_group.user_id
    @user_group.group_id = params[:group_id] || @user_group.group_id
    if @user_group.save! 
      render 'show.json.jbuilder'
    else
      render json: {}
    end
  end

  def destroy
    @user_group = UserGroup.find_by(id: params[:id])
    @user_group.destroy
    render json: {message: "this user group has been successfully deleted"}    
  end
end
