class GuildPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.premium? || user.guilds.blank?
  end
end
