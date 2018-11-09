class HeroinesController < ApplicationController
  
  before_action :current_heroine, only: [:show, :edit]
  
  def index
    @heroines = Heroine.all
  end

  def new 
    @heroine = Heroine.new

  end

  def create
    Heroine.create(heroine_params)
    redirect_to heroines_path
  end

  def heroine_params
    heroine = params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def current_heroine
    @heroine = Heroine.find(params[:id])
  end
end
