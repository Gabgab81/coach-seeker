class My::OffersController < ApplicationController

def index
  @offers = policy_scope([:my, Offer])

end

end
