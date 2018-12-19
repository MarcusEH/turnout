class Api::GroupImagesController < ApplicationController
    before_action :authenticate_user
  def index
    @group_images = GroupImage.all
    render json: @group_images
  end

  def show
    @group_image = groupImage.find_by(group_id: params[:group_id])
    render json: @group_image
  end

  def create
    @group_image = GroupImage.new(
      group_id: params[:group_id],
      url: params[:url]
    )
    if @group_image.save
      render json: @group_image
    else
      render json: {:errors => @group_image.errors.full_messages},Status: :Bad_Request
    end
  end

  def update
    p 'started the update'
    @group_image = GroupImage.find_by(group_id: params[:group_id])
    @group_image.url = params[:url] || @group_image.url
    if @group_image.save
      p 'the image saved'
      render json: @group_image
    else
      render json: {:errors => @group_image.errors.full_messages}
    end
  end
end
