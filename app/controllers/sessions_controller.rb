class SessionsController < ApplicationController
  def create
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    user.token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    user.refresh_token = refresh_token if refresh_token.present?
    user.save
    session[:user_id] = user.user_id
    redirect_to "/"
    # redirect_to dashboard_path ### to be implemented for dashboard user story (issue #18)
  end
end
