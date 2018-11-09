class PowersController < ApplicationController

  before_action :current_power

  def current_power
    if params[:id]
      @power = Power.find(params[:id])
    else
      @power = Power.new
    end
  end

  def index
    @powers = Power.all
  end
end
