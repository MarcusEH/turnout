class Api::UserCalendarOpeningsController < ApplicationController
  def index
    @user_calendar_openings = UserCalendarOpening.all
    render 'index.json.jbuilder'
  end

  def show
    @user_calendar_opening = UserCalendarOpening.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @user_calendar_opening = UserCalendarOpening.new(
      user_id: params[:user_id],
      begin_time: params[:begin_time],
      end_time: params[:end_time]
    )
    if @user_calendar_opening.save
      render 'show.json.jbuilder'
    else
      render json: {:errors => @user_calendar_opening.errors.full_messages}
    end   
  end

  def update
    @user_calendar_opening = UserCalendarOpening.find_by(id: params[:id])
    @user_calendar_opening.user_id = params[:user_id]
    @user_calendar_opening.begin_time = params[:begin_time]
    @user_calendar_opening.end_time = params[:end_time]
    if @user_calendar_opening.save 
      render 'show.json.jbuilder'
    else
      render json: {}
    end
  end

  def destroy
    @user_calendar_opening = UserCalendarOpening.find_by(id: params[:id])
    if @user_calendar_opening.destroy
      render json: {message: "This opening has been removed successfully!"}
    end     
  end
end
