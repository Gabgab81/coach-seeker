class My::CoachingsController < ApplicationController

  def index
    @coachings = policy_scope(Coaching).where(user_id: current_user)
    # @coaching_sort_by_date = @coachings.sort_by {|coaching| coaching.coaching_date }
  end

end
