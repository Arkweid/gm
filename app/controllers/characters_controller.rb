class CharactersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    Character.create(character_params.merge(user: current_user))
    redirect_to edit_user_registration_path
  end

  private

  def character_params
    params.require(:character).permit(:game_id, :name, :description)
  end
end
