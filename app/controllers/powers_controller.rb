class PowersController < ApplicationController

  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    @booking = Booking.new
  end

end
