class TopController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC").page(params[:page]).per(10)
  end
end