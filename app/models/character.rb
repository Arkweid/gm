class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :guild, optional: true # this option allow nil
  has_many :invites

  validates :user_id, :game_id, :name, presence: true
end
