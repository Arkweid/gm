class CharacterDecorator < Drape::Decorator
  delegate_all

  def take_guild_title
    guild ? guild.title : 'Character doesn`t have guild'
  end

  def take_avatar_link
    avatar_link.blank? ? 'character_default_avatar.png' : avatar_link
  end
end
