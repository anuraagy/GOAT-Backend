require 'rails_helper'

describe Api::V1::FoodTypesController, :type => :controller do
  before(:each) do
    params = {
      :email => "test@goat-app.com",
      :name  => "Goaty McGoatface",
      :password => "iamthegoat",
      :token => SecureRandom.base58(24)
    }

    @user = User.create(params)
  end

  describe "POST #create" do
    it "Create a new food type" do
      params = {
        :name          => "Apple",
        :serving_size  => "1 Fruit",
        :calories      => 80,
        :fat           => 0,
        :protein       => 0,
        :token         => @user.token
      }

      post :create, :params => params
      json = JSON.parse(response.body)

      expect(json["name"]).to          eq(params[:name])
      expect(json["serving_size"]).to  eq(params[:serving_size])
      expect(json["calories"]).to      eq(params[:calories])
      expect(json["fat"]).to           eq(params[:fat])
      expect(json["protein"]).to       eq(params[:protein])
    end
  end

  describe "PATCH #update" do
    it "Update food type with patch" do
      create_params = {
        :name          => "Apple",
        :serving_size  => "1 Fruit",
        :calories      => 80,
        :fat           => 0,
        :protein       => 0
      }

      @food = FoodType.create(create_params)

      update_params = {
        :id            => @food.id,
        :name          => "Banana",
        :serving_size  => "1 Fruit",
        :calories      => 130,
        :fat           => 1,
        :protein       => 1,
        :token         => @user.token
      }

      patch :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["name"]).to          eq(update_params[:name])
      expect(json["serving_size"]).to  eq(update_params[:serving_size])
      expect(json["calories"]).to      eq(update_params[:calories])
      expect(json["fat"]).to           eq(update_params[:fat])
      expect(json["protein"]).to       eq(update_params[:protein])
    end
  end

  describe "PUT #update" do
    it "Update food type with put" do
      create_params = {
        :name          => "Apple",
        :serving_size  => "1 Fruit",
        :calories      => 80,
        :fat           => 0,
        :protein       => 0
      }

      @food = FoodType.create(create_params)

      update_params = {
        :id            => @food.id,
        :name          => "Banana",
        :serving_size  => "1 Fruit",
        :calories      => 130,
        :fat           => 1,
        :protein       => 1,
        :token         => @user.token
      }

      put :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["name"]).to          eq(update_params[:name])
      expect(json["serving_size"]).to  eq(update_params[:serving_size])
      expect(json["calories"]).to      eq(update_params[:calories])
      expect(json["fat"]).to           eq(update_params[:fat])
      expect(json["protein"]).to       eq(update_params[:protein])
    end
  end

  describe "GET #index" do
    it "Get all food types" do
      params = {
        :token => @user.token
      }

      get :index, :params => params
      json = JSON.parse(response.body)
      expected_json = FoodType.all.as_json

      expect(json).to eq(expected_json)
    end
  end

  describe "GET #search" do
    it "Search for a food type" do
      params = {
        :name => "Apple",
        :serving_size => "1 Fruit",
        :token => @user.token
      }

      get :search, :params => params
      json = JSON.parse(response.body)
      expected_json = FoodType.where(:name => params[:name], :serving_size => params[:serving_size]).as_json

      expect(json).to eq(expected_json)
    end
  end
end
