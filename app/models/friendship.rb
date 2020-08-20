class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.create_reciprocal_friendship(user_id, friend_id)
    Friendship.create(user_id: user_id, friend_id: friend_id)
    Friendship.create(user_id: friend_id, friend_id: user_id)
  end
end




# def self.create_reciprocal_for_ids(user_id, friend_id)
#   user_friendship = Friendship.create(user_id: user_id, friend_id: friend_id)
#   friend_friendship = Friendship.create(user_id: friend_id, friend_id: user_id)
#   [user_friendship, friend_friendship]
# end
