class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params)
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
