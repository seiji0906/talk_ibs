class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: @post.id)
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:comment][:post_id]
    @comment.save

    @post = Post.find(@comment.post_id)
    @comments = Comment.where(post_id: @comment.post_id)
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comments = Comment.where(post_id: @post.id)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comments_params)
    @post = Post.find(@comment.post_id)
    @comments = Comment.where(post_id: @post.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comments = Comment.where(post_id: @post.id)
    @comment.destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
