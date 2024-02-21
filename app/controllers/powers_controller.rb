class PowersController < ApplicationController

  def index
    if params[:powersearch].present?
      @powers = Power.where('lower(name) LIKE ?', "%#{params[:powersearch].downcase}%")
      @powers = @powers.where.not(user: current_user)
    else
      @powers = Power.where.not(user: current_user)
    end
  end

  def show
    @power = Power.find(params[:id])
    @booking = Booking.new
    @bookings = @power.bookings.where(user: current_user)
  end

  def new
    @power = Power.new()
  end

  def create
    @power = Power.new(power_params)
    @power.user = current_user
    if @power.save
      redirect_to powers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def power_params
    params.require(:power).permit(:name, :description, :category, :photo, :price)
  end
end
