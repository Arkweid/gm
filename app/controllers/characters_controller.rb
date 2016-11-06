class CharactersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_character, only: [:update, :destroy]

  respond_to :js

  def create
    @character = Character.create(character_params.merge(user: current_user))
  end

  def update
    @character.update(character_params)
  end

  def destroy
    @character.destroy
  end

  private

  def character_params
    params.require(:character).permit(:game_id, :name, :description)
  end

  def load_character
    @character = Character.find(params[:id])
  end
end
