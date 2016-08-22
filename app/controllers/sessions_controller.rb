class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render json: user
    else
      render json: {error: 'Invalid email or password.'}, status: 401
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: 'User logged out'}
  end
end
