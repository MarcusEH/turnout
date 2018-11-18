class Api::GroupEventsController < ApplicationController
  def index
    @group_events = GroupEvent.all
    render 'index.json.jbuilder'
  end

  def show
    @group_event = GroupEvent.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    group = Group.find_by(id: params[:group_id])

    @group_event = GroupEvent.new(
      # group_id: current_user.group_id
      group_id: params[:group_id],
      location: params[:location], #possibly make this something that can be selected by the app?
      begin_time: group.find_opening[0],
      end_time: group.find_opening[1],
      #should this instead be time slot and have find_openg return a range of datetime? ie rollback my migration and recreate time_slot.
      event_name: params[:event_name]
      )
    if @group_event.save 
      render 'show.json.jbuilder'
    else
      render json: {:errors => @group_event.errors.full_messages}
    end
  end


end
