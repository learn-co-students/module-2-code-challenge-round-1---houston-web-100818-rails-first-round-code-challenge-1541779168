class HeroinesController < ApplicationController

  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new

  end

  def create
    @heroine = Heroine.create(heroine_params(:name, :super_name, :power_id))
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:notice] = "Heroine must have a unique super name"
      redirect_to '/heroines/new'
    end
  end

  def heroine_params(*args)
    params.require(:heroine).permit(*args)
  end

end
