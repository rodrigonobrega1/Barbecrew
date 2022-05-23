class BarbecuesController < ApplicationController
  def index
    @barbecues: Barbecue.all
  end

  def show
    @barbecue = Barbecue.find(params[:id])
  end

  def new
    @barbecue = Barbecue.new
  end

  def create
    @barbecue = Barbecue.new(barbecue_params)
    @user = User.find(params[:user_id])
    @barbecue.user = @user
    if @barbecue.save
      redirect_to barbecue_path
    else
      render :new
    end
  end

  private

  def barbecue_params
    params.require(:barbecue).permit(:barbecue_model, :barbecue_type, :barbecue_price, :barbecue_description, :barbecue_location)
  end
end
