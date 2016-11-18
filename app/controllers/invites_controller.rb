class InvitesController < ApplicationController
  before_action :authenticate_user!

  def index
    @characters = current_user.characters
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.create(invite_params)
    #redirect_to user_characters_invites_path(user_id: current_user.id)
  end

  def delete
  end

  private

  def invite_params
    params.require(:invite).permit(:guild_id, :character_id, :description)
  end
end
