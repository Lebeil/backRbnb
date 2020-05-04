class Listing < ApplicationRecord
  validates :available_beds,
            presence: true,
            numericality: { only_integer: true, greather_than: 0, less_than: 8 }

  validates :price,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }

  validates :description,
            presence: true,
            length: { minimum: 140, too_short: "please write for a minimum of 140 characters"}

  validates :welcome_message,
            presence: true

  belongs_to :user
  belongs_to :city
  has_many :reservations
  has_many :users, through: :reservations
end
