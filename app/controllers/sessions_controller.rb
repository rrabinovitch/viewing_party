class SessionsController < ApplicationController
  def create
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    log_in(user)
    user.token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    user.refresh_token = refresh_token if refresh_token.present?
    user.save
    binding.pry
    # when root_path path helper works, switch this path out for that
    redirect_to "/"
  end
end
