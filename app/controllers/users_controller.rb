class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.user_search(params[:user_search])
  end

  def show
    @user = User.find(params[:id])
    @collections = @user.collections
    @joins = @user.joins.order("created_at desc")
    @follows = @user.followed_users
    @followed = @user.followers
    @keeps = @user.keeps.order("created_at desc")
  end
end
