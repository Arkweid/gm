class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :guild, optional: true # this option allow nil

  validates :user_id, :game_id, :name, presence: true

  def guild_title
    guild ? guild.title : 'Character doesn`t have guild'
  end
end
