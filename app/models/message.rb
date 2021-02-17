class Message < ApplicationRecord
  belongs_to :user
  belongs_to :coaching
  has_rich_text :content
  validates :content, presence: true
end
