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
  end
end
