class CoachingsController < ApplicationController

  def show
    @coaching = Coaching.find(params[:id])
    authorize @coaching
    @offer = Offer.find(@coaching.offer.id)
    @message = Message.new
    @messages = Message.where(coaching_id: @coaching.id)

  end

  def accept
    @coaching = Coaching.find(params[:id])
    @coaching.validation = 1
    @coaching.save
    redirect_to offer_coaching_path(@coaching.offer, @coaching)
  end

  def refuse
    @coaching = Coaching.find(params[:id])
    @coaching.validation = 2
    @coaching.save
    redirect_to offer_coaching_path(@coaching.offer, @coaching)
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @user_offer = User.find(@offer.user_id)
    @user = current_user
    @coaching = Coaching.new
    authorize @coaching
  end

  def create
    @coaching = Coaching.new(coaching_params)
    authorize @coaching
    @offer = Offer.find(params[:offer_id])
    @coaching.offer = @offer
    @coaching.user = current_user
    if
      @coaching.save
      redirect_to offer_coaching_path(@coaching.offer, @coaching)
    else
      render :new
    end
  end

  private

  def coaching_params
    params.require(:coaching).permit(:coaching_date)
  end

end
