class MoviesController < ApplicationController
  before_action :require_login

  def index
    keywords = params[:movie_keywords]
    sr = SearchResults.new
    @movies = keywords.nil? ? sr.top_forty : sr.keyword_results(keywords)
  end

  def show
    @movie = SearchResults.new.get_movie(params[:id])
  end
end
