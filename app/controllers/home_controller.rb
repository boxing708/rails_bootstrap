class HomeController < ApplicationController
  before_action :authenticate_user!

  def top
  end

  def mypage
    @favorite_blogs = current_user.favorite_blogs.includes(:user)
  end
end
