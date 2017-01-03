FactoryGirl.define do
  factory :character do
    user
    game
    name 'Jar the Great'
  end

  factory :invalid_character, class: 'Character' do
    user nil
    game nil
    name nil
  end
end
