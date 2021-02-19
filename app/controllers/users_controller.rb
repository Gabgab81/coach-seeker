class UsersController < ApplicationController
  def show
    @user = current_user if user_signed_in?
    authorize @user
    @offers = Offer.where(user: current_user)
    mycoaching = @offers.map { |offer| offer.id if offer.user == current_user }
    @coachings = Coaching.where(offer_id: mycoaching.first).last(5)
    @reviews = Review.where(user_id: current_user).last(5)
  end
end
