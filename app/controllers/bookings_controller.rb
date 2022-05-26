class BookingsController < ApplicationController

  def index
    #Bookings que EU FIZ
    @bookings = Booking.where(user: current_user)
    #Bookings que fizeram das minhas churrasqueiras
    #@booked = current_user.barbecues.flat_map do |barbecue|
    #  barbecue.bookings
    #end

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
    redirect_to root_path
  end

  private

  def booking_params

    params.require(:booking).permit(:date_in, :date_out)

    params.require(:booking).permit(:user_id, :barbecue_id)

  end

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
  end
end
