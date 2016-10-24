class InstitutesController < ApplicationController
  before_action :authenticate_user!

  def index
    @institutes = Institute.order('created_at DESC').all
    render :layout => 'landing'
  end

  def create
    institute = Institute.new(institute_params)
    current_user.institutes << institute
    render :json => { institute: institute }
  end

  private

  def institute_params
    params.require(:institute).permit(:name, :description, :image)
  end
end
