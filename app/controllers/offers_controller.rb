class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @user = User.find(current_user.id)
    @offer.user = @user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def my_courses
    @offers = Offer.where(user_id: current_user.id)
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :localisation, :photo, :discipline)
  end
end
