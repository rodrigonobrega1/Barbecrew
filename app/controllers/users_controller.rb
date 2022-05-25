class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def profile
    @user = current_user
  end

  # GET /trainers
  def index
    @user = User.all
  end

  # GET /trainers/1
  def show
    @user = current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email)
    end


end
