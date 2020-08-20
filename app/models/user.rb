class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def self.from_omniauth(auth)
    user = User.find_by(user_id: auth[:uid]) || User.new
    user.attributes = {
      user_id: auth[:uid],
      username: auth[:info][:email],
      token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token]
    }
    user.save!
    user
  end
end
