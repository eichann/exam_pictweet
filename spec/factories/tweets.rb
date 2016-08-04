FactoryGirl.define do
  factory :tweet do
    user
    text "hello!"
    image "hoge.png"
  end
end
