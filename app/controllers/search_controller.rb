class SearchController < ApplicationController
  def index
    if params[:q]
      redirect_to root_path if params[:q].empty?

      @results = Album.search_tank(params[:q])
    end
  end

end
