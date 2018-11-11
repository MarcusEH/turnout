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
      render json: {}
    end   
  end
end
