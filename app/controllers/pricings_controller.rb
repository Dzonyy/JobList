class PricingsController < ApplicationController
  def index
    @pricings = Pricing.all
  end
end
