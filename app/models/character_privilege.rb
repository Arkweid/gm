class CharacterPrivilege < ApplicationRecord
  belongs_to :character

  def grant_privilege(privilege)
    return false if granted_modules.include?(privilege) || !allowed_privileges.include?(privilege)

    granted_modules << privilege
    save
  end

  def remove_privilege(privilege)
    granted_modules.delete(privilege)
    save
  end

  private

  def allowed_privileges
    ['Newsmaker', 'Right hand', 'Officer', 'Designer', 'Recruter']
  end
end
