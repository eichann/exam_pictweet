FactoryGirl.define do
  factory :user do
    nickname "abe"
    email { Faker::Internet.email }
    password "00000000"
    password_confirmation "00000000"

    factory :user_with_tweets do
      ignore do
        tweets_count 3
      end
      after(:create) do |user, evaluator|
        create_list(:tweet, evaluator.tweets_count, user: user)
      end
    end
  end
end
