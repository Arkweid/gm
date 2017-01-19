class GuildPanel::InvitesController < ApplicationController
  before_action :authenticate_user!

  layout 'guild_panel'

  before_action :load_guild, only: [:index]
  before_action :load_invites, only: [:index, :approval, :accepted, :reject]

  def index
  end

  def approval
    @invite.accepted
  end

  def accepted
    @invite.accepted

    @character.enroll_in_guild(@invite)
  end

  def reject
    @invite.reject
  end

  private

  def load_guild
    @guild = Guild.find(params[:guild_id])
  end

  def load_invites
    @invites = Invite.where(guild_id: @guild.id)
  end
end
1