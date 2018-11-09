class HeroinesController < ApplicationController
  before_action :define_current_heroine

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

  def new 
    @powers = Power.all
  end 

  def create 
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save 
      redirect_to heroines_path(@heroine)
    else 
      flash[:notice] = "Couldn't create this heroine. "
      @heroine.errors.messages.each do |k, v|
        flash[:notice] << "#{k.capitalize} #{v[0]}. "
    end 
      flash[:notice]
      redirect_to new_heroine_path
    end 
  end 

  def index
    if params[:search]
      @heroines = Heroine.search(params[:search])
    else 
      @heroines = Heroine.all
    end 
  end

end
