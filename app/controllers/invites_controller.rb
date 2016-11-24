class InvitesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_invite, only: [:destroy]

  def index
    @invites = current_user.invites
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.create(invite_params)
    redirect_to user_invites_path(user_id: current_user.id)
  end

  def destroy
    @invite.destroy

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
