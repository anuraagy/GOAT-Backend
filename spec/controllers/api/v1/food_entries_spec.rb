require 'rails_helper'

describe Api::V1::FoodEntriesController, :type => :controller do
  before(:each) do
    user_params = {
      :email => "test@goat-app.com",
      :name  => "Goaty McGoatface",
      :password => "iamthegoat",
      :token => SecureRandom.base58(24)
    }
    @user = User.create(user_params)

    food_type_params = {
      :name          => "Apple",
      :serving_size  => "1 Fruit",
      :calories      => 80,
      :fat           => 0,
      :protein       => 0
    }
    @food_type = FoodType.create(food_type_params)
  end

  describe "POST #create" do
    it "Create a new food entry" do
      params = {
        :food_type     => "#{@food_type.id}",
        :servings      => 2,
        :meal_type     => "Breakfast",
        :user_id       => @user.id,
        :token         => @user.token
      }
      post :create, :params => params
      json = JSON.parse(response.body)

      expect(json["food_type"]).to     eq(params[:food_type])
      expect(json["servings"]).to      eq(params[:servings])
      expect(json["meal_type"]).to     eq(params[:meal_type])
      expect(json["user_id"]).to       eq(params[:user_id])
    end
  end

  describe "PATCH #update" do
    it "Update food entry with patch" do
      create_params = {
        :food_type     => "#{@food_type.id}",
        :servings      => 2,
        :meal_type     => "Breakfast",
        :user_id       => @user.id
      }

      @food = FoodEntry.create(create_params)

      update_params = {
        :id            => @food.id,
        :food_type     => "#{@food_type.id}",
        :servings      => 1,
        :meal_type     => "Lunch",
        :user_id       => @user.id,
        :token         => @user.token
      }

      patch :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["food_type"]).to     eq(update_params[:food_type])
      expect(json["servings"]).to      eq(update_params[:servings])
      expect(json["meal_type"]).to     eq(update_params[:meal_type])
      expect(json["user_id"]).to       eq(update_params[:user_id])
    end
  end

  describe "PUT #update" do
    it "Update food entry with put" do
      create_params = {
        :food_type     => "#{@food_type.id}",
        :servings      => 2,
        :meal_type     => "Breakfast",
        :user_id       => @user.id
      }

      @food = FoodEntry.create(create_params)

      update_params = {
        :id            => @food.id,
        :food_type     => "#{@food_type.id}",
        :servings      => 1,
        :meal_type     => "Lunch",
        :user_id       => @user.id,
        :token         => @user.token
      }

      put :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["food_type"]).to     eq(update_params[:food_type])
      expect(json["servings"]).to      eq(update_params[:servings])
      expect(json["meal_type"]).to     eq(update_params[:meal_type])
      expect(json["user_id"]).to       eq(update_params[:user_id])
    end
  end

  describe "GET #index" do
    it "Get specific food entries" do
      params = {
        :user_id => @user.id,
        :token => @user.token
      }

      get :index, :params => params
      json = JSON.parse(response.body)
      expected_json = FoodEntry.where(:user_id => @user.id).as_json

      expect(json).to eq(expected_json)
    end
  end

  describe "DELETE #destroy" do
    it "Destroy an food entry" do
      create_params = {
        :food_type     => "#{@food_type.id}",
        :servings      => 2,
        :meal_type     => "Breakfast",
        :user_id       => @user.id
      }
      @food_entry = FoodEntry.create(create_params)

      destroy_params = {
        :id => @food_entry.id,
        :token => @user.token
      }

      delete :destroy, :params => destroy_params
    end
  end
end
