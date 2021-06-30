class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def my_friends
    @user_friends = current_user.friends
  end

  def requests
    @pending_friends = current_user.pending_friends
    @inverted_friendships = current_user.inverted_friendships
  end
end
