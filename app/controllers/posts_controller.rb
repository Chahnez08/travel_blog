class PostsController < ApplicationController
  def index
    @posts = Post.all.order(published_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = comment.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :location, :image_url, :published_at)
  end

end
