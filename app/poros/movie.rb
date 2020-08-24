class Movie
  attr_reader :id, :title
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
  end

  def summary
    movie = MovieDBService.new.find_by(@id)
    movie[:overview]
  end

  def vote_avg
    movie = MovieDBService.new.find_by(@id)
    movie[:vote_average]
  end
end
