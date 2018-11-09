class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(params_heroine)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      render json: { "message": @heroine.errors.messages }
    end
  end

  def params_heroine
    params[:heroine].permit(:name, :super_name, :power_id)
  end
end
