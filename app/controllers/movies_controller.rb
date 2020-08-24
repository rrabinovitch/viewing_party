class MoviesController < ApplicationController
  before_action :require_login

  def index
    # code here to account for listing top 40 vs. keyword search
    @movies = SearchResults.new.top_forty
  end

  def show
    @movie = SearchResults.new.get_movie(params[:id])
  end
end
