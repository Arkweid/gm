class GuildPanel::NewsController < ApplicationController
  before_action :authenticate_user!

  layout 'guild_panel'

  before_action :load_guild

  def index
    @news = News.where(guild: @guild)
  end

  def create
    news_param_with_credentials = news_params.merge(author_id: current_user, guild_id: @guild.id)
    @news = News.create(news_param_with_credentials)
  end

  private

  def load_guild
    @guild = Guild.find(params[:guild_id])
  end

  def news_params
    params.require(:news).permit(:title, :short_content, :content, :published)
  end
end
