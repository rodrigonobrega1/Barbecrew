class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show; end

  def new
    @booking = Booking.new
    @barbecue = Barbecue.find(params[:barbecue_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.barbecue = Barbecue.find(params[:barbecue_id])
    if @booking.save
      redirect_to bookings_path
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
    params.require(:booking).permit(:date_in, :date_out)
  end

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
  end
end
