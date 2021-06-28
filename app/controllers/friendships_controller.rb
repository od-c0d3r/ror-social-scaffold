class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friendship][:friend_id])
    redirect_to root_path if @friendship.save
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.confirm_friend
    redirect_to my_friends_path
  end

  def destroy
    relationships = params[:id].split('/')
    @friendship = Friendship.find_by(id:relationships[0])
    @friendship.delete
    @friendship = Friendship.find_by(id:relationships[1])
    @friendship.delete
    redirect_to root_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
