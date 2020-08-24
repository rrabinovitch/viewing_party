class MovieDBService
  def top_rated(page_num)
    response = conn.get('/3/movie/top_rated') do |req|
      req.params['api_key'] = ENV['MOVIE_DB_API_KEY_V3']
      req.params['language'] = 'en-US'
      req.params['page'] = page_num.to_s
    end
    parse(response)
  end

  def find_by(id)
    response = conn.get("/3/movie/#{id}") do |req|
      req.params['api_key'] = ENV['MOVIE_DB_API_KEY_V3']
      req.params['language'] = 'en-US'
    end
    parse(response)
  end

  private

  def conn
    Faraday.new(
      url: 'https://api.themoviedb.org',
      headers: { 'Accept': 'application/json' }
    )
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
