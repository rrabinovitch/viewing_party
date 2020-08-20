class FriendshipsController < ApplicationController
  def create
    friend_email = params[:email]
    @friend = User.find_by(username: friend_email)
    if @friend
      # Friendship.create(user_id: current_user.id, friend_id: @friend.id)
      Friendship.create_reciprocal_friendship(current_user.id, @friend.id)
      flash[:success] = "You have added #{@friend.username} as a friend."
    else
      flash[:error] = "User with email #{friend_email} does not exist."
    end
    redirect_to dashboard_path
  end
end



# def create
#   #is this bulk addition or individual addition?
#   if params.include?(:friend_id) #individual e.g. "Add friend" link
#     @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, params[:friend_id])
#   else
#     params[:user][:friend_ids].each do |f_id|
#       @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, f_id)
#     end
#   end
#   redirect_to users_path
# end
#
# def destroy
#   Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
#   redirect_to(request.referer)
# end
