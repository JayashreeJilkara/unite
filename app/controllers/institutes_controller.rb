class InstitutesController < ApplicationController
  before_action :authenticate_user!

  def create
    institute = Institute.create(user_id: current_user[:id],
                                 name: institute_params[:name],
                                 description: institute_params[:description])
    render :json => institute
  end

  private

  def institute_params
    params.require(:institute).permit(:name, :description)
  end
end
