require 'rails_helper'

describe CharacterPolicy do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:character) { create :character, user: user }

  subject { CharacterPolicy.new(user, character) }

  context 'user is owner' do
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'user is not owner' do
    let(:character) { create :character, user: another_user }

    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action(:destroy) }
  end
end
