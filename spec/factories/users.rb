FactoryGirl.define do
  factory :user do
    nickname "yuya"
    email { Faker::Internet.email }
    password "00000000"
    password_confirmation "00000000"
    after(:create) do |user|
      3.times { create(:tweet, user: user) }
    end
  end
end