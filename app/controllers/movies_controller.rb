class MoviesController < ApplicationController
  before_action :require_login

  def index
  end

  def show
    @movie = SearchResults.new.get_movie(params[:id])
  end
end
