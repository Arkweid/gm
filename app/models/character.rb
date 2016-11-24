class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :guild, optional: true # this option allow nil
  has_many :invites

  validates :user_id, :game_id, :name, presence: true

  def guild_title
    guild ? guild.title : 'Character doesn`t have guild'
  end

  def get_avatar_link
    avatar_link.blank? ? 'character_default_avatar.png' : avatar_link
  end
end
