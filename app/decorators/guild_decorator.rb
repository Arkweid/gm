class GuildDecorator < Drape::Decorator
  delegate_all

  def take_emblem_link
    emblem_link.blank? ? 'guild_default_emblem.png' : emblem_link
  end
end
