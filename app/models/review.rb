class Review < ApplicationRecord
  RATE = (1..10).to_a
  belongs_to :offer
  belongs_to :user
  has_rich_text :content
  validates :rating, presence: true, inclusion: { in: (1..10).to_a }
end
