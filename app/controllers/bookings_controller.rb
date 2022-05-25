class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_user

  def new
    @bookmark = Bookmark.new
  end

  def create
    @booking = Booking.new(booking_params)
    @bookmark.user = @user
    if @bookmark.save
      redirect_to list_path(@user)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :barbecue_id)
  end

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
  end

  def set_user
    @user = user.find(params[:user_id])
  end
end
