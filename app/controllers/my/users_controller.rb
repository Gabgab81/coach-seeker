class My::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @offers = Offer.where(user_id: params[:id]).last(5)
    @reviews = Review.where(user_id: params[:id]).last(5)
  end

  # private
  #
  # def user_params
  #   params.require([:my, :user]).permit(:id)
  # end
end
