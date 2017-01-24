require 'rails_helper'

describe Api::V1::PurchasedItemsController, :type => :controller do
  before(:each) do
    user_params = {
      :email => "test@goat-app.com",
      :name  => "Goaty McGoatface",
      :password => "iamthegoat",
      :token => SecureRandom.base58(24)
    }
    @user = User.create(user_params)

    item_type_params = {
      :name => "Gold toed socks",
      :description => "Will make you run faster",
      :image => "http://photos.amazingsocks.com/500/101s-gold-toe-3-pr-pack-metropolitan-nylon-ankle-sock-14039.jpg",
      :value => 100
    }
    @item_type = ItemType.create(item_type_params)
  end

  describe "GET #index" do
    it "Get all the items that a user has" do
      params = {
        :user_id => @user.id,
        :item_type => @item_type.id,
        :token => @user.token
      }

      get :index, :params => params
      json = JSON.parse(response.body)
      expected_json = PurchasedItem.where(:user_id => @user.id, :item_type => @item_type.id).as_json

      expect(json).to eq(expected_json)
    end
  end

  describe "POST #create" do
    it "Create a new item" do
      params = {
        :user_id => @user.id,
        :item_type => @item_type.id,
        :token => @user.token
      }

      post :create, :params => params
      json = JSON.parse(response.body)

      expect(json["user_id"]).to eq(params[:user_id])
      expect(json["item_type"]).to eq(params[:item_type])
    end
  end
end
