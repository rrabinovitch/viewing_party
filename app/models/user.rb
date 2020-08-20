class User < ApplicationRecord
  has_many :friended_users, foreign_key: :friender_id, class_name: 'Friend'
  has_many :friendees, through: :friended_users

  has_many :friendee_users, foreign_key: :friendee_id, class_name: 'Friend'
  has_many :frienders, through: :friendee_users

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
