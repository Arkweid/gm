class Guild < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :characters

  validates :user_id, :game_id, :title, presence: true
end
