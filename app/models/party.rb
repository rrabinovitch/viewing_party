class Party < ApplicationRecord
  has_many :user_parties, dependent: :destroy
  has_many :attendees, through: :user_parties, class_name: 'User'

  def movie
    SearchResults.new.get_movie(movie_id).title
  end
end
