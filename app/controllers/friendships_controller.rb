class FriendshipsController < ApplicationController
  def create
    friend_email = params[:email]
    @friend = User.find_by(username: friend_email)
    unless @friend.nil?
      Friendship.create(user_id: current_user.id, friend_id: @friend.id)
      flash[:success] = "You have added #{@friend.username} as a friend."
    else
      flash[:error] = "User with email #{friend_email} does not exist."
    end
    redirect_to dashboard_path
  end
end
