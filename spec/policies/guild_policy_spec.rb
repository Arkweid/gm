require 'rails_helper'

describe GuildPolicy do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:guild) { create :guild, user: user }

  subject { GuildPolicy.new(user, guild) }

  context 'user is owner' do
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'user is not owner' do
    let(:guild) { create :guild, user: another_user }

    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'not a premium user' do
    it { is_expected.to forbid_action(:create) }
  end

  context 'premium user' do
    let(:user) { create :user, premium: true }

    it { is_expected.to permit_action(:create) }
  end
end
