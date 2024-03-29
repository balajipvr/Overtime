class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to @post
  end

  def show

  end

 private
  def post_params
    params.require(:post).permit(:date,:rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
