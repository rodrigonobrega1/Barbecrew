class BookingsController < ApplicationController

  def index
    #Bookings que EU FIZ
    @bookings = Booking.where(user: current_user)
    #Bookings que fizeram das minhas churrasqueiras
    @booked = current_user.barbecues.map do |barbecue|
      barbecue.bookings
    end
  end

  def show
  end

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
