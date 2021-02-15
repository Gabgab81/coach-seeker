class Offer < ApplicationRecord
  DISC = ["Volley", "Poker", "Belotte"]
  belongs_to :user
  has_one_attached :photo
  validates :title, presences: true, length: { minimum: 50 }
  validates :description, presences: true
  validates :localisation, presences: true, length: { minimum: 50 }
  validates :discipline, presences: true, inclusion: { in: DISC,
    message: "%{value} is not a valid discipline" }
end
