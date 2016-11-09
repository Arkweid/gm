class SearchController < ApplicationController
  def index
    @found = Guild.search(params[:q])
  end
end
