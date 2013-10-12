class Api::V1::CommentsController < ApplicationController
  respond_to :json # default to Active Model Serializers
  def index
    render json: Comment.all
  end

  def show
    render json: Comment.find(params[:id])
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id

    if comment.save
      render json: comment
    else
      render json: { error: true }
    end
  end

  def update
    render json: Comment.update(params[:id], comment_params)
  end

  def destroy
    render json: Comment.destroy(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :post_id) # only allow these for now
  end
end