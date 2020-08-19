class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(user_id: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.username = auth.info.email
    end
  end
end
