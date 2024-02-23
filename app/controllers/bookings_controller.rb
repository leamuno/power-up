class BookingsController < ApplicationController
  def index
  end

  def create
    start_date = params[:booking][:start_date]
    end_date = params[:booking][:end_date]
    @power = Power.find(params[:power_id])
    @booking = Booking.new(booking_params)
    @booking.start_date = start_date
    @booking.end_date = end_date
    @booking.power = @power
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "powers/show", status: :unprocessable_entity, booking:@booking
    end
  end

  def update
    @booking = Booking.find(params[:id])
  if @booking.update(booking_params)
    redirect_to bookings_path
  end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
