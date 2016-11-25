FactoryGirl.define do
  factory :invite do
    guild
    character
  end

  factory :invalid_invite, class: 'Invite' do
    guild nil
    character nil
  end
end
