class Offer < ApplicationRecord
  DISC = ["Volley", "Poker", "Belotte"]
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :localisation, presence: true, length: { maximum: 50 }
  validates :discipline, presence: true, inclusion: { in: ["Volley", "Poker", "Belotte"],
    message: "%{value} is not a valid discipline" }
end
