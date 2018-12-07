class Api::CommentsController < ApplicationController
  before_action :authenticate_user
  def index
    @comments = Comment.where(group_id: params[:group_id])
    render json: @comments
  end

  def create
    @comment = Comment.new(
      comment_text: params[:comment],
      user_id: current_user.id,
      group_id: params[:group_id]
    )
    if @comment.save
      render json: @comment
    else
      render json: {:errors => @comment.errors.full_messages}, Status: :Bad_Request
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    render json: {message: "comment deleted"}
  end
end
