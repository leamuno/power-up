class BookingsController < ApplicationController
  def index
  end

  def create
    dates = params[:booking][:start_date].split(" to ")
    start_date = DateTime.parse(dates.first)
    end_date = DateTime.parse(dates.last)
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

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
