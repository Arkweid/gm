class GuildPanel::GuildsController < ApplicationController
  before_action :load_guild

  def update
    @guild.update_attributes(update_params)
    redirect_to :back
  end

  private

  def load_guild
    @guild = Guild.find(params[:id])
  end

  def update_params
    params.require(:guild).permit(:game_id, :title, :description, :emblem_link)
  end
end
