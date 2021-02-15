class UsersController < ApplicationController

  def show
    @users = User.all
    raise
  end


end
