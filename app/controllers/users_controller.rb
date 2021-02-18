class UsersController < ApplicationController

  def show
    @user = current_user if user_signed_in?
    @coachings = Coaching.where(user_id: current_user).last(5)
    @reviews = Review.where(user_id: current_user).last(5)
  end



end
