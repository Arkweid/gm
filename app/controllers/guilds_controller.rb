class GuildsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_guild, only: [:update, :destroy, :edit, :show]
  before_action :load_games, only: [:index, :edit, :new]

  def index
    @guilds = current_user.guilds
  end

  def new
    @guild = Guild.new
    authorize @guild
  end

  def create
    @guild = Guild.new(guild_params.merge(user: current_user))
    authorize @guild
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
    params.require(:guild).permit(:game_id, :title, :description, :emblem_link)
  end

  def load_guild
    @guild = Guild.find(params[:id])
  end

  def load_games
    @games = Game.all
  end
end
