class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user_id, :game_id, :name, presence: true

  def guild_title
    guild = self.guild_id
    return 'Character doesn`t have guild' if guild.nil?

    Guild.find(guild).title
  end
end
