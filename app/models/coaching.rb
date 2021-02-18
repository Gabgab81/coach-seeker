class Coaching < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :messages

  enum validation: [:not_set, :accepted, :refused]
end
