# Movie PORO - does not save in DB!
class Movie
  attr_reader :id, :title, :vote_avg, :summary, :genres, :runtime

  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    @vote_avg = movie_data[:vote_average]
    @summary = movie_data[:overview]
    @genres = movie_data[:genres].map do |genre_hash|
      genre_hash[:name]
    end
    @runtime = movie_data[:runtime]
    @search_results ||= SearchResults.new
  end

  def first_ten_cast_members
    @search_results.get_cast_members(@id).first(10)
  end

  def reviews
    @search_results.get_reviews(@id)
  end
end
