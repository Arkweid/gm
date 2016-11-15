class Guild < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :characters
  has_many :invites

  validates :user_id, :game_id, :title, presence: true

  scope :search, ->(search) { where('title LIKE ?', "%#{search}%") }
end
