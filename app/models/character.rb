class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user_id, :game_id, :name, presence: true
end
