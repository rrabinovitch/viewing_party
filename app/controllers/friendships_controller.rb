class FriendshipsController < ApplicationController
  def create
    @friend = User.find_by(username: params[:email])
    Friendship.create(user_id: current_user.id, friend_id: @friend.id)
    flash[:success] = "You have added #{@friend.username} as a friend."
    redirect_to dashboard_path
  end
end
