class UsersController < ApplicationController
  def index
    @users = User.index_all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
