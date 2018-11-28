class Api::UserCalendarOpeningsController < ApplicationController
  before_action :authenticate_user
  def index
    @user_calendar_openings = UserCalendarOpening.where(user_id: current_user)
    render 'index.json.jbuilder'
  end

  def show
    @user_calendar_opening = UserCalendarOpening.find_by(id: params[:id])
    if @user_calendar_opening.user_id == current_user.id
      render 'show.json.jbuilder'
    else
      render json: {message: "You are unauthorized to view this page. Please login or create an account."}, Status: :Unauthorized
    end
  end

  def create
    if current_user
      @user_calendar_opening = UserCalendarOpening.new(
        user_id: current_user.id,
        begin_time: params[:begin_time],
        end_time: params[:end_time]
      )
      if @user_calendar_opening.save
        render 'show.json.jbuilder'
      else
        render json: {:errors => @user_calendar_opening.errors.full_messages}, Status: :Bad_Request
      end
    else
      render json: {message: "please login to enter your availability"}, Status: :Unauthorized
    end   
  end

  def update
    @user_calendar_opening = UserCalendarOpening.find_by(id: params[:id])
    if current_user.id == @user_calendar_opening.user_id
      # @user_calendar_opening.user_id = current_user.id
      @user_calendar_opening.begin_time = params[:begin_time]
      @user_calendar_opening.end_time = params[:end_time]
      if @user_calendar_opening.save 
        render 'show.json.jbuilder'
      else
        render json: {:errors => @user_calendar_opening.errors.full_messages}, Status: :Bad_Request
      end
    else
      render json: {message: "please login to update your availability"}, Status: :Unauthorized
    end   
  end

  def destroy
    @user_calendar_opening = UserCalendarOpening.find_by(id: params[:id])
    if current_user.id == @user_calendar_opening.user_id
      if @user_calendar_opening.destroy
        render json: {message: "This opening has been removed successfully!"}
      end  
    else
      render json: {message: "please login to remove your availabilities"}, Status: :Unauthorized
    end   
  end
end
