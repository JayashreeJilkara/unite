class InstitutesController < ApplicationController
  before_action :authenticate_user!

  def create
    institute = Institute.new(institute_params)
    current_user.institutes << institute
    render :json => { institute: institute }
  end

  private

  def institute_params
    params.require(:institute).permit(:name, :description)
  end
end
