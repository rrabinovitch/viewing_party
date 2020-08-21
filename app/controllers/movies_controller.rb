class MoviesController < ApplicationController
  def index
    # Refactor this disaster into a MovieDB Poro?
    conn = Faraday.new(url: 'https://api.themoviedb.org', headers: { 'Accept': 'application/json' })

    page1 = conn.get('/3/movie/top_rated') do |req|
      req.params['api_key'] = ENV["MOVIE_DB_API_KEY_V3"]
      req.params['language'] = 'en-US'
      req.params['page'] = '1'
    end

    page2 = conn.get('/3/movie/top_rated') do |req|
      req.params['api_key'] = ENV["MOVIE_DB_API_KEY_V3"]
      req.params['language'] = 'en-US'
      req.params['page'] = '2'
    end
    
    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    @movies_pg1 = json1[:results]
    @movies_pg2 = json2[:results]

    until json2[:results].count == 0
      json1[:results] << json2[:results].shift
    end

    @movies = json1[:results]
  end
end
