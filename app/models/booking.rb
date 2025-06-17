class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :flight
end
