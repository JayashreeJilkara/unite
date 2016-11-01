class InstitutesController < ApplicationController
  before_action :authenticate_user!

  def index
    @institutes = Institute.order('created_at DESC').all
  end

  def show
    @institute = Institute.find(params[:id])
    @breadcrumbs = [
        {text: 'Institutes', href: institutes_path, class: ''},
        {text: @institute.name, href: '#', class: 'active'}
    ]
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
