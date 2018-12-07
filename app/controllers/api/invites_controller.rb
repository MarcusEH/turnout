class Api::InvitesController < ApplicationController
  before_action :authenticate_user, :authenticate_admin
  def index
    @invites = Invite.where(group_id: params[:group_id])
    render json: @invites
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
