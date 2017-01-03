require 'rails_helper'

RSpec.describe GuildsController, type: :controller do
  sign_in_user

  let(:game) { create :game }
  let(:guild) { create :guild, user: @user }
  let(:another_user) { create :user }

  describe 'POST #create' do
    context 'guild with valid data' do
      it 'save new guild for user' do
        expect { post :create, params: { user_id: @user.id, guild: attributes_for(:guild).merge(game_id: game.id) } }
          .to change(@user.guilds, :count).by(1)
      end

      it 'save only one guild for not premium user' do
        guild

        expect { post :create, params: { user_id: @user.id, guild: attributes_for(:guild).merge(game_id: game.id) } }
          .to_not change(@user.guilds, :count)
      end

      it 'save more then one guild for premium user' do
        @user.toggle! :premium
        guild

        expect { post :create, params: { user_id: @user.id, guild: attributes_for(:guild).merge(game_id: game.id) } }
          .to change(@user.guilds, :count).by(1)
      end
    end

    context 'guild with invalid data' do
      it 'will not saved' do
        expect { post :create, params: { user_id: @user.id, guild: attributes_for(:invalid_guild) } }
          .to_not change(@user.guilds, :count)
      end
    end
  end

  describe 'PATCH #update' do
    context 'user is owner' do
      it 'changes guild attribute' do
        patch :update, params: { user_id: @user.id, id: guild, guild: { title: 'Jar band' } }
        guild.reload
        expect(guild.title).to eq 'Jar band'
      end
    end

    context 'user is not owner' do
      let(:guild) { create :guild, user: another_user }

      it 'cant change character attribute' do
        patch :update, params: { user_id: @user.id, id: guild, guild: { title: 'Jar band' } }
        guild.reload
        expect(guild.title).to_not eq 'Jar band'
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user owner' do
      let!(:guild) { create :guild, user: @user }

      it 'delete character' do
        expect { delete :destroy, params: { user_id: @user.id, id: guild } }
          .to change(Guild, :count).by(-1)
      end
    end

    context 'not owner' do
      let!(:guild) { create :guild, user: another_user }

      it 'cant delete character' do
        expect { delete :destroy, params: { user_id: @user.id, id: guild } }
          .to_not change(Guild, :count)
      end
    end
  end
end
