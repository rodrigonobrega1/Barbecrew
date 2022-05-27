class BarbecuesController < ApplicationController
  before_action :set_barbecue, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @barbecues = Barbecue.all
    @search = params["search"]
    if @search.present?
      @model = @search["barbecue_model"]
      @barbecues = Barbecue.where(barbecue_model: @model)
    end

    @markers = @barbecues.geocoded.map do |barbecue|
      {
        lat: barbecue.latitude,
        lng: barbecue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { barbecue: barbecue }),
        image_url: helpers.asset_url("barbecrew2")
      }
    end
  end

  def show
  end

  def new
    @barbecue = Barbecue.new
  end

  def create
    @barbecue = Barbecue.new(barbecue_params)
    @user = current_user
    @barbecue.user = @user
    if @barbecue.save
      redirect_to user_barbecue_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @barbecue.update(barbecue_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @barbecue.destroy
    redirect_to user_barbecues_path
  end

  private

  def barbecue_params
    params.require(:barbecue).permit(:barbecue_model, :barbecue_type, :barbecue_price, :barbecue_description, :barbecue_location, :picture, :user_id)
  end

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
  end
end
