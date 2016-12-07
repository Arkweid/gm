class GuildPolicy < ApplicationPolicy
  def new?
    create?
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def create?
    user.premium? || user.guilds.blank?
  end

  def destroy?
    user.owner_of?(record)
  end
end
