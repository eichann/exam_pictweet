require 'rails_helper'

describe User do
  it "is invalid without a nickname" do
    user = build(:user, nickname: '')
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = build(:user, email: '')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with over 6 char nickname" do
    user = build(:user, nickname: Faker::Lorem.characters(7))
    user.valid?
    expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
  end

  it "is invalid with a duplicate email" do
    user1 = create(:user)
    user2 = build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "can count her own tweets" do
    user = create(:user)
    3.times{ create(:tweet, user_id: user.id) }
    expect(user.count_tweets).to eq 3
  end
end

