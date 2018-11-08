class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def show
    @user = User.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      # group_id: params[:group_id],
      admin: params[:admin]
    )
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {message: "cannot save this user, please check your inputs. admin must be boolean."}
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    # @user.group_id = params[group_id] || @user.group_id
    @user.admin = params[:admin] || @user.admin
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {message: "this user could not be updated with the information you provided please check your form"}
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: {message: "this user has been successfully deleted"}
  end
end
