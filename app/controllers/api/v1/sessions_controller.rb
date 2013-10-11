class Api::V1::SessionsController < ApplicationController
  before_action :logout

  def create
    if current_user && (params[:session][:user_id].to_i == current_user.id)
      render json: { session: { id: 1, user_id: current_user.id } }
    else
      user = User.where(name: params[:session][:name]).first
      if user && user.check_password(params[:session][:password])
        session[:user_id] = user.id
        render json: { session: { id: 1, user_id: user.id } }
      else
        render json: { error: true }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    render json: {}, status: :accepted
  end

private
  def logout
    session[:user_id] = nil
  end
  # def session_params
  #   params.require(:session).permit(:name, :password, :user) # only allow these for now
  # end
end