class InstitutesController < ApplicationController
  before_action :authenticate_user!

  def index
    @institutes = Institute.order('created_at DESC').all
  end

  def my_institutes
    @institutes = Institute.order('created_at DESC').where(user_id: current_user.id)
  end

  def show
    @institute = Institute.find(params[:id])
    @breadcrumbs = [
        {text: 'Institutes', href: institutes_path, class: ''},
        {text: @institute.name, href: '#', class: 'active'}
    ]
  end

  def new
    @institute = Institute.new
    @breadcrumbs = [
        {text: 'My Institutes', href: my_institutes_path, class: ''},
        {text: 'Create Institute', href: '#', class: 'active'}
    ]
  end

  def create
    institute = Institute.new(institute_params)
    current_user.institutes << institute

    redirect_to my_institutes_path
  end

  private

  def institute_params
    params.require(:institute).permit(:name, :description, :image, :courses_attributes =>
        [:course_name, :fee_structure, :duration]
    )
  end
end
