require 'rails_helper'

describe Api::V1::UsersController, :type => :controller do
  describe "POST #create" do
    it "Creates a new user" do
      params = {
        :email => "test@goat-app.com",
        :name  => "Goaty McGoatface",
        :password => "iamthegoat"
      }

      post :create, :params => params
      json = JSON.parse(response.body)

      expect(json["email"]).to eq(params[:email])
      expect(json["name"]).to eq(params[:name])
      expect(json["token"])
    end
  end

  describe "POST #sign_in" do
    it "Signs in the user" do
      params = {
        :email => "test@goat-app.com",
        :name => "Goaty McGoatface",
        :password => "iamthegoat",
        :token => SecureRandom.base58(24)
      }

      user = User.create(params)
      post :sign_in, :params => params
      json = JSON.parse(response.body)

      expect(json["email"]).to eq(user.email)
      expect(json["token"]).to eq(user.token)
    end
  end
end
