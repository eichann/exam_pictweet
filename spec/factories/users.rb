FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password(8)
    nickname Faker::Lorem.characters(6)
  end
end