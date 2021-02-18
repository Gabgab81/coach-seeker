class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer).order(created_at: :desc)
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    sports_list = Offer.sports_list
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def my_courses
    @offers = Offer.where(user_id: current_user.id)
    authorize @offers
    render :index
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :localisation, :photo, :discipline)
  end
end
