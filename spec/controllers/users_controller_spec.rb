require 'rails_helper'

describe UsersController do
  let (:user) { create(:user) }

  # show
  it "has instance variable @nickname" do
    sign_in user

    get :show, id: user
    expect(assigns(:nickname)).to eq(user.nickname)
  end

  it "has instance variable @tweets" do
    sign_in user
    3.times{ create(:tweet, user_id: user.id) }

    get :show, id: user
    expect(assigns(:tweets)).to eq(user.tweets)
  end

  it "has instance variable @tweets_count" do
    sign_in user
    3.times{ create(:tweet, user_id: user.id) }

    get :show, id: user
    expect(assigns(:tweets_count)).to eq(user.count_tweets)
  end
end