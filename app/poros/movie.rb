class Movie
  attr_reader :id, :title, :vote_avg, :overview
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    @vote_avg = movie_data[:vote_average]
    @overview = movie_data[:overview]
  end
end
