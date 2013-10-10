class Api::V1::UsersController < ApplicationController
  respond_to :json # default to Active Model Serializers
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    render json: User.create(user_params)
  end

  def update
    render json: User.update(params[:id], user_params)
  end

  def destroy
    render json: User.destroy(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password) # only allow these for now
  end

end
