class UsersController < ApplicationController
  def index
    @users = User.select(:id, :name, :email).with_attached_icon.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
