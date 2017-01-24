require 'rails_helper'

describe Api::V1::ItemTypesController, :type => :controller do
  before(:each) do
    params = {
      :email => "test@goat-app.com",
      :name  => "Goaty McGoatface",
      :password => "iamthegoat",
      :token => SecureRandom.base58(24)
    }
    @user = User.create(params)
  end

  describe "GET #index" do
    it "Get all the available items" do
      params = {
        :token => @user.token
      }

      get :index, :params => params
      json = JSON.parse(response.body)
      expected_json = ItemType.all.as_json

      expect(json).to eq(expected_json)
    end
  end
end
