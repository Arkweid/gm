class CharacterPolicy < ApplicationPolicy

  def create?
    user.id == record.user_id
  end

  def destroy?
    user.owner_of?(record)
  end
end
