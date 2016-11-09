require 'rails_helper'

RSpec.describe GuildsController, type: :controller do
  sign_in_user

  let(:game) { create :game }
  let(:guild) { create :guild, user: @user }

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
end
