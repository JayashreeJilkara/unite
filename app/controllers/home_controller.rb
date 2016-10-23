class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @institutes = Institute.order('created_at DESC').all
    render :layout => 'landing'
  end
end
