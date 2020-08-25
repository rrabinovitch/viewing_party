class ViewingPartiesController < ApplicationController
  def new
    @movie = SearchResults.new.get_movie(params[:movie_id])
  end

  def create
    
  end
end
