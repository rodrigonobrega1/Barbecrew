class BookingsController < ApplicationController

  before_action :set_booking, only: :destroy

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :barbecue_id)
  end

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
  end
end
