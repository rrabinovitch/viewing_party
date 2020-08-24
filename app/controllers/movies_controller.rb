class MoviesController < ApplicationController
  before_action :require_login

  def index
    # refactor to an unless statement?
    if params[:movie_keywords].nil?
      @movies = SearchResults.new.top_forty
    else
      # binding.pry
      # find movie results based on params[:movie_keywords]
    end
    # if query params include keywords, perform that search,
    # else, show top40 results (those are the two routes to
    # get to this index action)
  end

  def show
    @movie = SearchResults.new.get_movie(params[:id])
  end
end
