require 'rails_helper'

describe TweetsController do
  # index
  it "render template index" do
    get :index
    expect(response).to render_template :index
  end

  # new
  it "render template new" do
    get :new
    expect(response).to render_template :new
  end

  # create
  it "create success" do
    sign_in create(:user)

    expect {
      post :create, tweet: attributes_for(:tweet)
    }.to change(Tweet, :count).by(1)
  end

  # destroy
  it "destroy success" do
    user = create(:user)
    sign_in user

    tweet = create(:tweet, user_id: user.id)
    expect {
      delete :destroy, id: tweet
    }.to change(Tweet, :count).by(-1)
  end

  # edit
  it "assigns edit Tweet" do
    tweet = create(:tweet)
    get :edit, id: tweet
    expect(assigns(:tweet)).to eq(tweet)
  end

  # update
  it "change tweet" do
    user = create(:user)
    sign_in user

    tweet = create(:tweet, user_id: user.id)
    patch :update, id: tweet, text: "テスト"
    tweet.reload
    expect(tweet.text).to eq("テスト")
  end
end