require 'csv'

class Offer < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_one_attached :photo
  has_rich_text :description

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :localisation, presence: true, length: { maximum: 50 }
  validates :discipline, presence: true, inclusion: { in: ["Volley", "Poker", "Belotte"],
    message: "%{value} is not a valid discipline" }
  # validates :discipline, presence: true, inclusion: { in: :sports_list,
  #   message: "%{value} is not a valid discipline" }


  def self.sports_list
  #   # ["Volley", "Poker", "Belotte"]
    sport_array = []
    CSV.foreach('app/assets/data/sportlist.csv') do |row|
      sport_array << row
    end
    sport_array
  end

end
