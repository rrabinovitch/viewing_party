class Movie
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    # @vote_avg = movie_data[:vote_average]
    # @summary = movie_data[:overview]
  end
end
