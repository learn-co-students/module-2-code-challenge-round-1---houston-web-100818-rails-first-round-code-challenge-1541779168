class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  before_action :current_power, only: [:show]


  def current_power
    @power = Power.find(params[:id])
  end
end
