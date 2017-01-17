class GuildPolicy < ApplicationPolicy
  def show
    return true if record.user == user
    record.visible
  end

  def new?
    create?
  end

  def create?
    user.premium? || user.guilds.blank?
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    user.owner_of?(record)
  end
end
