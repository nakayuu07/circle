class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
     @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @collections = @user.collections
    @joins = @user.joins.order("created_at desc")
    @follows = @user.followed_users
    @followed = @user.followers
  end
end
