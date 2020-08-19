class User < ApplicationRecord
  def self.from_omniauth(auth)
    # where(email: auth.info.email).first_or_initialize do |user|
    #   user.name = auth.info.name
    #   user.email = auth.info.email
    # end

    where(user_id: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end
