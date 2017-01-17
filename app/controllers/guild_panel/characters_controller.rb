class GuildPanel::CharactersController < ApplicationController
  before_action :authenticate_user!

  layout 'guild_panel'

  before_action :load_guild

  def index
    @characters = Character.where(guild: @guild).decorate
  end

  def grant_privilege
  end

  def remove_privilege
  end

  private

  def load_guild
    @guild = Guild.find(params[:guild_id])
  end
end
