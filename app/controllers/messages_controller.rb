class MessagesController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    @coaching = Coaching.find(params[:coaching_id])
    @message = Message.new
    authorize @message
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @coaching = Coaching.find(params[:coaching_id])
    @message.coaching = @coaching
    authorize @message
    if @message.save!
      redirect_to offer_coaching_path(@coaching.offer, @coaching)
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :coaching_id)
  end
end
