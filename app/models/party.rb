class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :user_parties
  has_many :attendees, through: :user_parties

  def movie
    get_movie(self.movie_id)
  end
end
