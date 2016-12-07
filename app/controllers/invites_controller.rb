class InvitesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_invite, only: [:destroy, :reject]

  def index
    #policy only for youself
    @invites = current_user.invites
  end

  def new
    @invite = Invite.new
  end

  def create
    #policy only for youself
    @invite = Invite.create(invite_params)
    redirect_to user_invites_path(user_id: current_user.id)
  end

  def destroy
    #policy only for admin
    @invite.destroy

    redirect_to action: :index
  end

  def reject
    #policy only for youself
    @invite.rejection

    redirect_to action: :index
  end

  private

  def invite_params
    params.require(:invite).permit(:guild_id, :character_id, :description)
  end

  def load_invite
    @invite = Invite.find(params[:id])
  end
end
