class SearchResults
  def initialize
    @service = MovieDBService.new
  end

  def top_forty
    page1 = @service.top_rated(1)
    page2 = @service.top_rated(2)
    movies = page1[:results] << page2[:results].shift until page2[:results].count.zero?
    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
