class Api::V1::SessionsController < ApplicationController
  before_action :logout

  def create

    if !current_user
      user = User.where(name: params[:session][:name]).first

      if user && user.check_password(params[:session][:password])
        session[:user_id] = user.id
        render json: { session: {user_id: user.id} }
      else
        render json: { error: true }, status: 422
      end
    else
      render json: { error: true }, status: 422
    end
  end

  def destroy
  end

private
  def logout
    session[:user_id] = nil
  end
end