class BarbecuesController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @barbecues = Barbecue.all
    @search = params["search"]
    if @search.present?
      @model = @search["barbecue_model"]
      @barbecues = Barbecue.where(barbecue_model: @model)
    end
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

  def edit; end

  def update
    @barbecue.update(barbecue_params)

    redirect_to barbecues_path(@barbecue)
  end

  def destroy
    @barbecue = Barbecue.find(params[:id])
    @barbecue.destroy

    redirect_to @barbecue.user
  end

  private

  def barbecue_params
    params.require(:barbecue).permit(:barbecue_model, :barbecue_type, :barbecue_price, :barbecue_description, :barbecue_location)
  end
end
