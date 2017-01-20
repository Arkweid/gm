class GuildPanel::InvitesController < ApplicationController
  before_action :authenticate_user!

  layout 'guild_panel'

  before_action :load_guild, only: [:index]
  before_action :load_invites, only: [:index]
  before_action :load_invite, only: [:approval, :accepted, :reject]


  def index
  end

  def approval
    @invite.approval

    redirect_to :back
  end

  def accepted
    @invite.accepted
    @invite.character.enroll_in_guild(@invite)

    redirect_to :back
  end

  def reject
    @invite.reject

    redirect_to :back
  end

  private

  def load_guild
    @guild = Guild.find(params[:guild_id])
  end

  def load_invites
    @invites = @guild.invites
  end

  def load_invite
    @invite = Invite.find(params[:id])
  end
end
