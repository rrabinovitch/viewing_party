class MoviesController < ApplicationController
  before_action :require_login

  def index
    keywords = params[:movie_keywords]
    if keywords.nil?
      @movies = SearchResults.new.top_forty
    else
      @movies = SearchResults.new.keyword_results(keywords)
    end
  end

  def show
    @movie = SearchResults.new.get_movie(params[:id])
  end
end
