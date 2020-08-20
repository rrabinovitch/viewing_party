class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    session[:user_id] = user.user_id
    redirect_to dashboard_path
  end
end
