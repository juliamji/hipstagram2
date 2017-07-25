class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Your post has been created!'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Whoops, something went wrong. Please check the form.'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post successfully updated!'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post update failed. Please check the form.'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post deleted'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post not deleted. Please try again.'
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
