class PowersController < ApplicationController

  def show
    @power = Power.find(params[:id])
  end

  def index
    @powers = Power.all
  end
end
