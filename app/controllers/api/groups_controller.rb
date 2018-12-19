class Api::GroupsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update]
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
      event_type: params[:event_type]
    )
    if @group.save
      render 'show.json.jbuilder'
    else
      render json: {:errors => @group.errors.full_messages}, Status: :Bad_Request
    end
  end

  def update
    @group = Group.find_by(id: params[:id]) 
    @group.title = params[:title] || @group.title
    @group.event_type = params[:event_type] || @group.event_type
    @group.group_event_id = params[:group_event_id] || @group.group_event_id
    @group.group_image_id = params[:group_image_id] || @group.group_image_id
    if @group.save
      render 'show.json.jbuilder'
    else
      render json: {:errors => @group.errors.full_messages}, Status: :Bad_Request
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

  def send_email
    @usergroups = UserGroup.where(group_id: params[:id])
    
    @users = []
    @usergroups.each do |usergroup|
      p @usergroup
      user = User.find_by(id: usergroup.user_id)
      @users.push(user)
      p @users
    end 
    p params[:email_body]
    @body = params[:email_body]

    @users.each do |user|
      UserMailer.with(
      user: user,
      body: @body
      ).group_email.deliver_later
    end
    render json: {message: "your email has been sent"}
  end
end
