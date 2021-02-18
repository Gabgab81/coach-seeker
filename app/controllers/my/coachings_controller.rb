class My::CoachingsController < ApplicationController

  def index
    @coachings = Coaching.where(user_id: current_user)
  end

end
