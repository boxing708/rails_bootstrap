class CommentsController < ApplicationController

  def create
    # @blog = Blog.find(params[:blog_id])
    # @blog.comments.create(comment_params)
    # redirect_to blog_path(@blog)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @blog = Blog.find(params[:blog_id])
    @comment.blog_id = @blog.id

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :blog_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
