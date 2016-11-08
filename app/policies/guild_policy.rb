class GuildPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.premium? or user.guilds.blank?
  end
end