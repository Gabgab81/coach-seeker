class CoachingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def refuse?
    return true
  end

  def accept?
    return true
  end

end
