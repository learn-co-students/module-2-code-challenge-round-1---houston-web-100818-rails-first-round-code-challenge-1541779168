class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show 
    @heroine = Heroine.find(params[:id])
    @power = Power.find(@heroine.power_id)
  end

  def new 
    @heroine = Heroine.new
    @powers = Power.all
  end 

  def create 
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else 
      @powers = Power.all
      render :new 
    end
  end

  private

  def heroine_params 
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
