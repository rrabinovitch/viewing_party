class Party < ApplicationRecord
  belongs_to :user
  has_many :user_parties
  has_many :attendees, through: :user_parties

  def movie
    SearchResults.new.get_movie(self.movie_id).title
  end
end
