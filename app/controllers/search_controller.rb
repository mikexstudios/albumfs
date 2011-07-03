class SearchController < ApplicationController
  def index
    if params[:q]
      redirect_to root_path if params[:q].empty?
    end
  end

end
