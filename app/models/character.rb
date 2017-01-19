class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :guild, optional: true # this option allow nil
  has_many :invites
  has_one :character_privilege

  validates :user_id, :game_id, :name, presence: true

  def enroll_in_guild(invite)
    update_attributes(guild_id: invite.guild_id)
    grant_default_privileges(invite)
  end

  def kick
    update_attributes(guild_id: nil, guild_rank: 0)
    delete_character_privileges_row
  end

  def up_rank
    return false if self.guild_rank >= 20

    update_attributes(guild_rank: self.guild_rank + 1)
  end

  def down_rank
    return false if self.guild_rank.zero?

    update_attributes(guild_rank: self.guild_rank - 1)
  end

  private

  def grant_default_privileges(invite)
    CharacterPrivilege.create(character_id: invite.character_id)
  end

  def delete_character_privileges_row
    CharacterPrivilege.find_by(character_id: id).destroy
  end
end
