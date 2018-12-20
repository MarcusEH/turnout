class Api::GroupEventsController < ApplicationController
  before_action :authenticate_user
  # before_action :authenticate_admin, only: [:create]
  def index
    @current_user_groups = UserGroup.where(user_id: current_user.id)
    @group_events = GroupEvent.where(group_id: @current_user_groups)
    render 'index.json.jbuilder'
  end

  def show
    @group_event = GroupEvent.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    group = Group.find_by(id: params[:group_id])

    @group_event = GroupEvent.new(
      group_id: group.id,
      location: params[:location], 
      begin_time: group.find_opening[0],
      end_time: group.find_opening[1],
      event_name: params[:event_name]
      )
    if @group_event.save 
      render 'show.json.jbuilder'
    else
      render json: {:errors => @group_event.errors.full_messages}
    end
  end


end
