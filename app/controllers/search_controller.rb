class SearchController < ApplicationController
  def index
    @found = Guild.search_guild(params[:q]).decorate
  end
end
