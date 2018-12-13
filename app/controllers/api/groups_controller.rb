class Api::GroupsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, only: [:destroy]
  def index
    @groups = User.find(current_user.id).groups
    render 'index.json.jbuilder'
  end

  def show
    @group = Group.find_by(id: params[:id])
    render 'show.json.jbuilder'   
  end

  def create
    @group = Group.new(
      title: params[:title],
      event_type: params[:event_type],
      group_event_id: params[:group_event_id],
    )
    if @group.save
      render 'show.json.jbuilder'
    else
      render render json: {:errors => @group.errors.full_messages}, Status: :Bad_Request
    end
  end

  def update
    @group = Group.find_by(id: params[:id]) 
    @group.title = params[:title] || @group.title
    @group.event_type = params[:event_type] || @group.event_type
    @group.group_event_id = params[:group_event_id] || @group.group_event_id
    if @group.save
      render 'show.json.jbuilder'
    else
      render json: {message: "Could not update your group. Please check your information."}
    end
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    @group.destroy
    render json: {message: "your group has been deleted successfully"}
  end

  def event_info
    @groups = User.find(current_user.id).groups
    @groups_events = []
    @groups.each do |group|
      group.group_events.each do |event|
        @groups_events.push(event)
      end 
    end
    render 'event_info.json.jbuilder'
  end
end
