class Api::UsersController < ApplicationController
  before_action:authenticate_user, except: [:create, :get_keys]
  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def show
    @user = User.find_by(id: current_user.id)
    render 'show.json.jbuilder'
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      admin: params[:admin]
    )
    if @user.save
      UserMailer.with(
        user: @user
      ).welcome_email.deliver_now
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: current_user.id)
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.user_image_id = params[:user_image_id] || @user.user_image_id
    if params[:password]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation] 
    end    
    @user.admin = params[:admin] || @user.admin
    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @user = User.find_by(id: current_user.id)
    @user.destroy
    render json: {message: "this user has been successfully deleted"}
  end

  def get_keys
    @keys = []
    @api_key = ENV["API_KEY"]
    @client_key = ENV["CLIENT_ID"]
    @keys.push(@api_key, @client_key)
    render json: @keys
  end
end
