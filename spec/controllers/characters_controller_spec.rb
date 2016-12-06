require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  sign_in_user

  let(:game) { create :game }

  describe 'POST #create' do
    context 'character with valid data' do
      it 'save new character for user' do
        expect { post :create, params: { user_id: @user.id, character: attributes_for(:character).merge(game_id: game.id) } }
          .to change(@user.characters, :count).by(1)
      end
    end

    context 'character with invalid data' do
      it 'dont save new character for user' do
        expect { post :create, params: { user_id: @user.id, character: attributes_for(:invalid_character) } }
          .to_not change(Character, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:another_user) { create :user }
    let(:character) { create :character, user: @user }

    before { character }

    context 'user owner' do
      it 'delete character' do
        expect { delete :destroy, params: { user_id: @user.id, id: character } }
          .to change(Character, :count).by(-1)
      end
    end

    context 'not owner' do
      it 'cant delete character' do
        expect { delete :destroy, params: { user_id: another_user.id, id: character } }
          .to_not change(Character, :count)
      end
    end
  end
end
