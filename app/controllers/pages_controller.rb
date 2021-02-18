class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @offers = Offer.all
    @markers = @offers.geocoded.map do |offer|
      {
      lat: offer.latitude,
      lng: offer.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end
end
