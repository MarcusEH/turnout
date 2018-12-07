class Api::UserInterestsController < ApplicationController
  before_action :authenticate_user
  def index
    @user_interests = UserInterest.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end

  def show
    @user_interest = UserInterest.find_by(id: params[:id])
    if @user_interest.user_id == current_user.id
      render 'show.json.jbuilder'
    else
      render json: {:errors => @user_interest.errors.full_messages}, Status: :Unauthorized
    end
  end

  def create
    @user_interest = UserInterest.new(
      user_id: current_user.id,
      category: params[:category],
      interest_level: params[:interest_level],
      group_id: params[:group_id]
    )
    if @user_interest.save
      render 'show.json.jbuilder'
    else
      render json: {:errors => @user_interest.errors.full_messages}
    end
  end

  def update
    @user_interest = UserInterest.find_by(id: params[:id])
    @user_interest.category = params[:category]
    @user_interest.interest_level = params[:interest_level]
    if @user_interest.save!
      render 'show.json.jbuilder'
    else
      render json: {:errors => @user_interest.errors.full_messages}
    end
  end
end
