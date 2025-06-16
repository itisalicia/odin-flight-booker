# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airports = {}
[ "NYC", "LAX", "PAR", "LON", "BER", "ROM", "TOK", "MEL", "MEX", "VAN" ].each do |airport_code|
  airports[airport_code] = Airport.find_or_create_by!(code: airport_code)
end

Flight.create!([
  {
    departure_airport: airports["NYC"],
    arrival_airport: airports["PAR"],
    start_datetime: Time.new(2025, 6, 18, 8, 30, 0),
    flight_duration: 450
  },
  {
    departure_airport: airports["LON"],
    arrival_airport: airports["TOK"],
    start_datetime: Time.new(2025, 6, 19, 14, 15, 0),
    flight_duration: 690
  },
  {
    departure_airport: airports["LAX"],
    arrival_airport: airports["MEL"],
    start_datetime: Time.new(2025, 6, 21, 22, 45, 0),
    flight_duration: 900
  },
  {
    departure_airport: airports["ROM"],
    arrival_airport: airports["BER"],
    start_datetime: Time.new(2025, 6, 23, 11, 20, 0),
    flight_duration: 105
  },
  {
    departure_airport: airports["MEX"],
    arrival_airport: airports["VAN"],
    start_datetime: Time.new(2025, 6, 25, 16, 10, 0),
    flight_duration: 360
  },
  {
    departure_airport: airports["PAR"],
    arrival_airport: airports["NYC"],
    start_datetime: Time.new(2025, 6, 27, 13, 55, 0),
    flight_duration: 480
  },
  {
    departure_airport: airports["TOK"],
    arrival_airport: airports["LAX"],
    start_datetime: Time.new(2025, 6, 29, 19, 30, 0),
    flight_duration: 660
  },
  {
    departure_airport: airports["VAN"],
    arrival_airport: airports["LON"],
    start_datetime: Time.new(2025, 6, 30, 9, 15, 0),
    flight_duration: 540
  }
])
