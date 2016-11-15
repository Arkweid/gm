class SearchController < ApplicationController
  def index
    @found = Guild.search_guild(params[:q])
  end
end
