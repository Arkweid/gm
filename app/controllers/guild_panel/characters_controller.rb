class GuildPanel::CharactersController < ApplicationController
  before_action :authenticate_user!

  layout 'guild_panel'

  before_action :load_guild, only: [:index]
  before_action :load_character, only: [:kick]
  before_action :load_char_privileges, only: [:grant_privilege, :remove_privilege]

  def index
    # authorize
    @characters = Character.where(guild: @guild).decorate
  end

  def grant_privilege
    # authorize
    @char_privileges.grant_privilege(params['granted_module'])
  end

  def remove_privilege
    # authorize
    @char_privileges.remove_privilege(params['granted_module'])
  end

  def kick
    # authorize
    @character.kick
  end

  private

  def load_guild
    @guild = Guild.find(params[:guild_id])
  end

  def load_character
    @character = Character.find(params[:id])
  end

  def load_char_privileges
    @char_privileges = CharacterPrivilege.find_by(character_id: params[:id])
  end
end
