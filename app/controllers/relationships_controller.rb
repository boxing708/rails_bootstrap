class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    following = current_user.active_relationships.build(followed_id: params[:user_id])
    following.save
    # request.referrerと書くことで、以前のpathに戻ることができる
    redirect_to request.referrer || root_path
  end

  def destroy
    following = current_user.active_relationships.find_by(followed_id: params[:user_id])
    following.destroy
    # request.referrerと書くことで、以前のpathに戻ることができる
    redirect_to request.referrer || root_path
  end
end
