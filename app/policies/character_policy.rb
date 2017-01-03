class CharacterPolicy < ApplicationPolicy
  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def create?
    user.owner_of?(record)
  end

  def destroy?
    user.owner_of?(record)
  end
end
