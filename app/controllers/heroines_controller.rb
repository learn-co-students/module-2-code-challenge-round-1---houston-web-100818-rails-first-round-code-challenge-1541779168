class HeroinesController < ApplicationController
  # out of time, getting ArgumentError (Unsupported argument type: 1 (Fixnum)):
  # def index
  #   if params[:q]
  #     search_power = Power.find_by(name: "#{params[:q]}")
  #     @heroines = Heroine.where(power_id=search_power.id)
  #   else
  #     @heroines = Heroine.all
  #   end
  # end
  
  def index
    @heroines = Heroine.all    
  end

  def search
    @heroines = Heroine.searched(q)
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else 
      # don't know how to pass errors to user
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :q)
  end
end
