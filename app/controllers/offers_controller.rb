class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer).order(created_at: :desc)

    @offers = Offer.all

    if params[:request] && !(params[:request][:search].blank?)

      @offers = Offer.search_by_title_and_description(params[:request][:search])
    end
    if params[:request] && ! (params[:request][:discipline].blank?)
      sql_query = " \
        offers.discipline ILIKE :discipline
      "
      @offers = @offers.where(sql_query, discipline: "%#{params[:request][:discipline]}%")

    end
  end

  def new
    @offer = Offer.new
    authorize @offer
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

  # def my_courses
  #   @offers = Offer.where(user_id: current_user.id)
  #   # render :index
  # end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :localisation, :photo, :discipline)
  end
end
