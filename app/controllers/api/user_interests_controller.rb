class Api::UserInterestsController < ApplicationController
  def show
    @user_interest = UserInterest.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @user_interest = UserInterest.new(
      user_id: params[:user_id],
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
end
