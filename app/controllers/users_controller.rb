class UsersController < ApplicationController
  def index
    @users = User.with_attached_icon
  end

  def show
    @user = User.find(params[:id])
  end
end
