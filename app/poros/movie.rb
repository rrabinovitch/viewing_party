class Movie
  attr_reader :id, :title
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    @raw_hash ||= MovieDBService.new.find_by(@id)
  end

  def summary
    @raw_hash[:overview]
  end

  def vote_avg
    @raw_hash[:vote_average]
  end

  def genres
    @raw_hash[:genres].map do |genre_hash|
      genre_hash[:name]
    end
  end
end
