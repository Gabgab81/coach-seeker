class Offer < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
  has_rich_text :description

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :localisation, presence: true, length: { maximum: 50 }
  validates :discipline, presence: true, inclusion: { in: sports,
    message: "%{value} is not a valid discipline" }

  def self.sports
    ["Volley", "Poker", "Belotte"]
  end
end
