FactoryGirl.define do
  sequence :title do |n|
    "AlmasMortas#{n}"
  end

  factory :guild do
    user
    title
    game
    description 'Milky`s guild'
    emblem_link 'milky_face.jpg'
  end

  factory :invalid_guild, class: 'Guild' do
    user nil
    title nil
    game nil
  end
end
