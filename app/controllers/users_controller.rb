class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, status: 201
    else
      render json: {error: 'Invalid request'}, status: 400
    end
  end

  private
    def user_params
      params.require(:user)
          .permit(:first_name, :last_name, :email, :password, :password_confirmation, :occupation)
    end
end
