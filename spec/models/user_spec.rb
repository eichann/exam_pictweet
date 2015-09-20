require 'rails_helper'

describe User do
  describe '#create' do
    it "is invalid widthout a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "is valid with a nickname that have more than 7 characters" do
      user = User.create(nickname: "yuya", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      another_user = User.new(nickname: "yuya", email: user.email, password: "00000000", password_confirmation: "00000000")
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  end

  describe '#count_tweets' do
    let(:user){ create(:user) }
    subject { user.count_tweets }
    it { is_expected.to eq user.tweets.count }
  end
end
