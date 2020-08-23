class MoviesController < ApplicationController
  before_action :require_login

  def index
    # Refactor this disaster into a MovieDB Poro?
    conn = Faraday.new(url: 'https://api.themoviedb.org', headers: { 'Accept': 'application/json' })

    page1 = conn.get('/3/movie/top_rated') do |req|
      req.params['api_key'] = ENV['MOVIE_DB_API_KEY_V3']
      req.params['language'] = 'en-US'
      req.params['page'] = '1'
    end

    page2 = conn.get('/3/movie/top_rated') do |req|
      req.params['api_key'] = ENV['MOVIE_DB_API_KEY_V3']
      req.params['language'] = 'en-US'
      req.params['page'] = '2'
    end

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    json1[:results] << json2[:results].shift until json2[:results].count.zero?

    @movies = json1[:results]
    # @movies = json1[:results].map do |movie_data|
    #   Movie.new(movie_data)
    # end

  end

  def show
  end
end
