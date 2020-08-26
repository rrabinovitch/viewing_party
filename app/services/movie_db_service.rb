class MovieDBService
  def initialize
    @params = {
      'api_key' => ENV['MOVIE_DB_API_KEY_V3'],
      'language' => 'en-US'
    }
    @key_only = { 'api_key' => ENV['MOVIE_DB_API_KEY_V3'] }
  end

  def top_rated(page_num)
    response = conn.get('/3/movie/top_rated') do |req|
      req.params.merge!(@params)
      req.params['page'] = page_num.to_s
    end
    parse(response)
  end

  def keyword_search(page_num, keywords)
    response = conn.get('/3/search/movie') do |req|
      req.params.merge!(@params)
      req.params['query'] = keywords
      req.params['page'] = page_num.to_s
    end
    parse(response)
  end

  def movie_details(id)
    response = conn.get("/3/movie/#{id}") do |req|
      req.params.merge!(@params)
    end
    parse(response)
  end

  def movie_cast(id)
    response = conn.get("/3/movie/#{id}/credits") do |req|
      req.params.merge!(@key_only)
    end
    parse(response)
  end

  def movie_reviews(id)
    response = conn.get("/3/movie/#{id}/reviews") do |req|
      req.params.merge!(@params)
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
