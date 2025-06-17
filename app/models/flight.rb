class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.search(params)
    flights = Flight.all

    if params[:search].present?
      flights = flights.where("departure_airport_id = ? OR arrival_airport_id = ?", params[:search], params[:search])
    end

    if params[:start_datetime].present?
      flights = flights.where("start_datetime >= ?", params[:start_datetime])
    end

    if params[:end_datetime].present?
      flights = flights.where("start_datetime <= ?", params[:end_datetime])
    end

    if params[:departure_airport_id].present?
      flights = flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      flights = flights.where(arrival_airport_id: params[:arrival_airport_id])
    end
    flights
  end

  def formatted_date_options
    formatted_date.strftime("%m/%d/%Y")
  end

  def self.formatted_date_options
    unique_dates = order(:start_datetime).pluck(:start_datetime).uniq
    unique_dates.map { |date| [ date.strftime("%d %B %Y") ] }
  end
end
