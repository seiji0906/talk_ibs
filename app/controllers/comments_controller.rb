class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:comment][:post_id]
    @comment.save

    @post = Post.find(@comment.post_id)
    @comments = Comment.where(post_id: @comment.post_id)
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
