class SessionsController < ApplicationController
  def create
    access_token = request.env["omniauth.auth"]
    # require "pry"; binding.pry
    user = User.from_omniauth(access_token)
    session[:user_id] = user.user_id
    # redirect_to "/"
    # redirect_to dashboard_path ### to be implemented for dashboard user story (issue #18)
    redirect_to "/dashboard"
  end
end
