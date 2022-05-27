class BookingsController < ApplicationController
  before_action :set_barbecue, only: [:show, :edit, :update, :destroy]

  def index
    #Bookings que EU FIZ
    @bookings = Booking.where(user: current_user)
    #Bookings que fizeram das minhas churrasqueiras
    @booked = Booking.where(barbecues: { user: current_user }).joins(:barbecue)
  end

  def show
  end

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
    redirect_to bookings_path, notice: 'The booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:date_in, :date_out)
  end

  def set_barbecue
    @booking = Booking.find(params[:id])
  end
end
