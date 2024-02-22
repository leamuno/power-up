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

  def edit
    @power = Power.find(params[:id])
  end

  def update
    @power = Power.find(params[:id])
    if @power.update(power_params)
      redirect_to edit_user_registration_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @power = Power.new(power_params)
    @power.user = current_user
    if @power.save
      redirect_to edit_user_registration_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @power = Power.find(params[:id])
    @power.destroy
    redirect_to edit_user_registration_path, status: :see_other
  end

  private

  def power_params
    params.require(:power).permit(:name, :description, :category, :photo, :price)
  end
end
