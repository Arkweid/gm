class CharactersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_character, only: [:update, :destroy, :edit]

  respond_to :js

  def create
    @character = Character.create(character_params.merge(user: current_user))
    redirect_to user_characters_url(current_user)
  end

  def update
    @character.update(character_params)
    redirect_to user_characters_url(current_user), notice: 'Characer updated'
  end

  def destroy
    @character.destroy
    redirect_to :back
  end

  private

  def character_params
    params.require(:character).permit(:game_id, :name, :description)
  end

  def load_character
    @character = Character.find(params[:id])
  end
end
