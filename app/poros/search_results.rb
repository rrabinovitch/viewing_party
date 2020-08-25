class SearchResults
  def initialize
    @service = MovieDBService.new
  end

  def top_rated_movies
    page1 = @service.top_rated(1)
    page = 2
    until page1[:results].size >= 40
      next_page = @service.top_rated(page)
      page1[:results] << next_page[:results].shift until next_page[:results].empty?
      page += 1
    end
    page1[:results]
  end

  def top_forty
    movies = top_rated_movies.first(40)
    movies.map do |movie_data|
      get_movie(movie_data[:id])
    end
  end

  def keyword_results(keywords)
    page1 = @service.keyword_search(1, keywords)
    page2 = @service.keyword_search(2, keywords)
    if page2[:results].empty?
      movies = page1[:results]
    else
      movies = page1[:results] << page2[:results].shift until page2[:results].empty?
    end
    movies.map do |movie_data|
      get_movie(movie_data[:id])
    end
  end

  def get_cast_members(movie_id)
    @service.movie_cast(movie_id)[:cast].map do |member_data|
      CastMember.new(member_data)
    end
  end

  def get_movie(id)
    movie_data = @service.movie_details(id)
    Movie.new(movie_data)
  end

  def get_reviews(movie_id)
    @service.movie_reviews(movie_id)[:results].map do |review_data|
      Review.new(review_data)
    end
  end
end
