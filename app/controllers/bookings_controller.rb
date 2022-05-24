class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking = @booking.barbecue.create(booking_params)
    if @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :barbecue_id)
  end
end
