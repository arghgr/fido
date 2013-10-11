class Api::V1::PostsController < ApplicationController
  respond_to :json # default to Active Model Serializers
  def index
    render json: Post.all
  end

  def show
    render json: Post.find(params[:id])
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      render json: post
    else
      render json: { error: true }
    end
  end

  def update
    render json: Post.update(params[:id], post_params)
  end

  def destroy
    render json: Post.destroy(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :intro, :extended, :published_at) # only allow these for now
  end
end