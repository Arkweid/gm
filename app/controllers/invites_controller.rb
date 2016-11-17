class InvitesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @invite = Invite.new
    @guild_id = params[:guild_id]
  end

  def create
  end

  def delete
  end

  private

  def invite_params
    params.require(:invite).permit(:guild_id, :character_id, :description)
  end
end
