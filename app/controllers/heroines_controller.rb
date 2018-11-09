class HeroinesController < ApplicationController

  before_action :current_heroine

  def current_heroine
    if params[:id]
      @heroine = Heroine.find(params[:id])
    else
      @heroine = Heroine.new
    end
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def index
    @heroines = Heroine.all
  end

  def new
    @powers = Power.all
  end

  def create
    @heroine.assign_attributes(heroine_params)

    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:notice] = "Couldn't create heroine. "
      @heroine.errors.messages.each do |attribute, msg|
        flash[:notice] << "#{attribute.to_s.split("_").join(" ").capitalize} #{msg[0]}. "
      end
      redirect_to new_heroine_path
    end
  end

  # def search
  #   redirect_to heroines_path
  # end
end
