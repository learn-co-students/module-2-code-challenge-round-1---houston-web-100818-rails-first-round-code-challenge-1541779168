class PowersController < ApplicationController

  before_action :define_current_power

  def index
    @powers = Power.all
  end

  def new
    @power = Power.new
  end
    
  def create
    @power = Power.create(power_params)
    redirect_to power_path(@power)
  end
    
  def show
    @power = Power.find(params[:id])
  end
    
  def edit
    @power = Power.find(params[:id])
  end
    
  def update
    @power = Power.find(params[:id])
    @power.update(power_params)
    redirect_to @power
  end

  private

  def define_current_power
    if params[:id]
        @power = Power.find(params[:id])
    else
        @power = Power.new
    end
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
