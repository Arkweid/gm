require 'rails_helper'

RSpec.describe InvitesController, type: :controller do
  sign_in_user

  let(:guild) { create :guild, user: @user }
  let(:character) { create :character, user: @user }

  describe 'POST #create' do
    context 'invite with valid data' do
      it 'be a new record' do
        expect { post :create, params: { user_id: @user.id, invite: { guild_id: guild, character_id: character } } }
          .to change(@user.invites, :count).by(1)
      end
    end

    context 'invite with invalid data' do
      it 'not be a new record' do
        expect { post :create, params: { user_id: @user.id, invite: attributes_for(:invalid_invite) } }
          .to_not change(Invite, :count)
      end
    end
  end

  describe 'POST #destroy' do
    context 'as user owner' do
      it 'destroy invite' do
        expect { post :create, params: { user_id: @user.id, invite: { guild_id: guild, character_id: character } } }
          .to change(@user.invites, :count).by(1)
      end
    end
  end
end
