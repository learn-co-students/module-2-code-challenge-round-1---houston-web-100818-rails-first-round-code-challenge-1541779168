class HeroinesController < ApplicationController
  
  before_action :define_current_heroine

  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end
    
  def create
    @heroine = Heroine.create(heroine_params)
    redirect_to @heroine
  end
    
  def show
    @heroine = Heroine.find(params[:id])
  end
    
  def edit
    @heroine = Heroine.find(params[:id])
  end
    
  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params)
    redirect_to @heroine
  end

  private

  def define_current_heroine
    if params[:id]
        @heroine = Heroine.find(params[:id])
    else
        @heroine = Heroine.new
    end
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
