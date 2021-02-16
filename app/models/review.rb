class Review < ApplicationRecord
  RATE = (1..10)
  belongs_to :offer
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: RATE }
end
