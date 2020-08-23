class MoviesController < ApplicationController
  before_action :require_login

  def index
    @movies = SearchResults.new.top_forty
  end

  def show
  end
end
