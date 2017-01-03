require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  sign_in_user

  let(:game) { create :game }
  let(:another_user) { create :user }

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

  describe 'PATCH #update' do
    context 'user is owner' do
      let(:character) { create :character, user: @user }

      it 'changes character attribute' do
        patch :update, params: { user_id: @user.id, id: character, character: { name: 'Jar the Noobie' } }
        character.reload
        expect(character.name).to eq 'Jar the Noobie'
      end
    end

    context 'user is not owner' do
      let(:character) { create :character, user: another_user }

      it 'cant change character attribute' do
        patch :update, params: { user_id: @user.id, id: character, character: { name: 'Jar the Noobie' } }
        character.reload
        expect(character.name).to eq 'Jar the Great'
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:another_user) { create :user }

    context 'user owner' do
      let!(:character) { create :character, user: @user }

      it 'delete character' do
        expect { delete :destroy, params: { user_id: @user.id, id: character } }
          .to change(Character, :count).by(-1)
      end
    end

    context 'not owner' do
      let!(:character) { create :character, user: another_user }

      it 'cant delete character' do
        expect { delete :destroy, params: { user_id: @user.id, id: character } }
          .to_not change(Character, :count)
      end
    end
  end
end
