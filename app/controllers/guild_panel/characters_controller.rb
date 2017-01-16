class GuildPanel::CharactersController < ApplicationController
  layout 'guild_panel'

  before_action :load_guild

  def index
    @characters = Character.where(guild: @guild)
  end

  private

  def load_guild
    @guild = Guild.find(params[:guild_id])
  end

  def character_params
    params.require(:news).permit(:title, :short_content, :content, :published)
  end
end
