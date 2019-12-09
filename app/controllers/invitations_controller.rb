# frozen_string_literal: true

class InvitationController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)

    if !User.find_by(email: @invitation.email).nil?
      @invitation.invited_user_id = User.find_by(email: @invitation.email).id
      @invitation.save
      flash[:notice] = 'Invitation sent'
      redirect_to event_path(params[:invitation][:event_id])
    else
      flash[:warn] = 'There is no user with this email'
      redirect_to invite_path(eventid: params[:invitation][:event_id])
    end
  end

  def show; end

  private



    def invitation_params
      params.require(:invitation).permit(:email, :event_creator, :event_id)
    end
  

end
