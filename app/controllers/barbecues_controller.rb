class BarbecuesController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @barbecues = Barbecue.all
   # @search = params["search"]
   # if @search.present?
   #   @model = @search["barbecue_model"]
   #   @barbecues = Barbecue.where(barbecue_model: @model)
   # end

    @markers = @barbecues.geocoded.map do |barbecue|
      {
        lat: barbecue.latitude,
        lng: barbecue.longitude
        #info_window: render_to_string(partial: "info_window", locals: { barbecues: barbecue })
        #image_url: helpers.asset_url("barbecrew2")
      }
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
    @user = current_user
    @barbecue.user = @user
    if @barbecue.save

      redirect_to root_path

      redirect_to users_path

    else
      render :new
    end
  end

  def edit
    @barbecue = Barbecue.find(params[:id])
  end

  def update
    @barbecue.update(barbecue_params)

    redirect_to users_path
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
