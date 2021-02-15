class Offer < ApplicationRecord
  DISC = ["Volley", "Poker", "Belotte"]

  has_many :reviews
  belongs_to :user
  validates :title, presences: true, length: { minimum: 50 }
  validates :description, presences: true
  validates :localisation, presences: true, length: { minimum: 50 }
  validates :discipline, presences: true, inclusion: { in: DISC,
    message: "%{value} is not a valid discipline" }
end
