class MoviesController < ApplicationController
  before_action :require_login

  def index
    movie_db = MovieDBService.new
    page1 = movie_db.top_rated(1)
    page2 = movie_db.top_rated(2)

    @movies = page1[:results] << page2[:results].shift until page2[:results].count.zero?

    # @movies = json1[:results].map do |movie_data|
    #   Movie.new(movie_data)
    # end

  end

  def show
  end
end
