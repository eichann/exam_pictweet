FactoryGirl.define do
  factory :tweet do
    text Faker::Lorem.sentence
    image Faker::Avatar.image
  end
end