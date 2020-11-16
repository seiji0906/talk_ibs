class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id).all
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    @posts = Post.all
    @post.save
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(posts_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end