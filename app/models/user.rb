class User < ApplicationRecord
  def self.from_omniauth(auth)
    # where(user_id: auth.uid).first_or_create do |user|
    #   user.token = auth.credentials.token
    #   user.refresh_token = auth.credentials.refresh_token
    #   user.username = auth.info.email
    # end

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
