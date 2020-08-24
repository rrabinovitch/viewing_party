class MoviesController < ApplicationController
  before_action :require_login

  def index
    # if query params include keywords, perform that search,
    # else, show top40 results (those are the two routes to
    # get to this index action)
    @movies = SearchResults.new.top_forty
  end

  def show
    @movie = SearchResults.new.get_movie(params[:id])
  end
end
