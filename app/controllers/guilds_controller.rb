class GuildsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_guild, only: [:update, :destroy, :edit, :show]

  def index
    @guilds = current_user.guilds
  end

  def new
    @guild = authorize Guild.new
  end

  def create
    @guild = authorize Guild.new(guild_params.merge(user: current_user))
    @guild.save

    redirect_to action: :index
  end

  def update
    @guild.update(guild_params)

    redirect_to action: :index
  end

  def destroy
    @guild.destroy

    redirect_to action: :index
  end

  private

  def guild_params
    params.require(:guild).permit(:game_id, :title)
  end

  def load_guild
    @guild = Guild.find(params[:id])
  end
end
