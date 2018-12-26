class Api::UserImagesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update]
  def index
    @user_images = User.find(current_user.id).user_images
    render json: @user_images
  end

  def show
    @user_image = UserImage.find_by(id: params[:id])
    render json: @user_image
  end

  def create
    @user_image = UserImage.new(
      user_id: current_user.id,
      url: params[:url]
    )
    if @user_image.save
      render json: @user_image
    else
      render json: {:errors => @user_image.errors.full_messages}
    end
  end

  def update
    p 'started the update'
    @user_image = UserImage.find_by(user_id: current_user.id)
    @user_image.url = params[:url] || @user_image.url
    if @user_image.save
      p 'the image saved'
      render json: @user_image
    else
      p 'the image did not save'
      render json: {:errors => @user_image.errors.full_messages}
    end
  end
end
