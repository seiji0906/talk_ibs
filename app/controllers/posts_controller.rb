class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comments = Comment.where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    @posts = Post.all.order(id: "DESC")
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
