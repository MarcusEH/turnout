class Api::InvitesController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]
  def index
    if current_user
      user_email = current_user.email
      @invites = Invite.where(email: user_email)
      render 'index.json.jbuilder'
    end
  end

  def show
    @invite = Invite.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @invite = Invite.new(
      email: params[:email],
      group_id: params[:group_id]
    )
    if @invite.save
      render json: @invite
    else
      render json: {:errors => @invite.errors.full_messages}, Status: :Bad_Request
    end
  end

  def destroy
    @invite = Invite.find_by(id: params[:id])
    @invite.destroy
    render json: {message: "invite removed"}
    
  end
end
