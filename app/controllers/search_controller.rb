class SearchController < ApplicationController
  def index
    if params[:q] and not params[:q].empty?

      @results = Album.search_tank(params[:q], :page => params[:page])
    else
      redirect_to root_path
    end
  end

end
