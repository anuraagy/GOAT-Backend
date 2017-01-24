require 'rails_helper'

describe Api::V1::ExerciseTypesController, :type => :controller do
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
    it "Create a new exercise type" do
      params = {
        :name => "Barbell Bench Press",
        :description => "A chest/shoulders exercise that works the entire upper body using a barbell.",
        :token => @user.token
      }

      post :create, :params => params
      json = JSON.parse(response.body)

      expect(json["name"]).to         eq(params[:name])
      expect(json["description"]).to  eq(params[:description])
    end
  end

  describe "PATCH #update" do
    it "Update an exercise type with patch" do
      create_params = {
        :name => "Barbell Bench Press",
        :description => "A chest/shoulders exercise that works the entire upper body using a barbell."
      }

      @exercise_type = ExerciseType.create(create_params)

      update_params = {
        :id   => @exercise_type.id,
        :name => "Dumbless Bench Press",
        :description => "A chest/shoulders exercise that works the entire upper body using two dumbells.",
        :token => @user.token
      }

      patch :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["name"]).to         eq(update_params[:name])
      expect(json["description"]).to  eq(update_params[:description])
    end
  end

  describe "PUT #update" do
    it "Update an exercise type with patch" do
      create_params = {
        :name => "Barbell Bench Press",
        :description => "A chest/shoulders exercise that works the entire upper body using a barbell."
      }

      @exercise_type = ExerciseType.create(create_params)

      update_params = {
        :id   => @exercise_type.id,
        :name => "Dumbless Bench Press",
        :description => "A chest/shoulders exercise that works the entire upper body using two dumbells.",
        :token => @user.token
      }

      put :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["name"]).to         eq(update_params[:name])
      expect(json["description"]).to  eq(update_params[:description])
    end
  end

  describe "GET #index" do
    it "Get all exercise types" do
      params = {
        :token => @user.token
      }

      get :index, :params => params
      json = JSON.parse(response.body)
      expected_json = ExerciseType.all.as_json

      expect(json).to eq(expected_json)
    end
  end

  describe "GET #search" do
    it "Search for an exercise type" do
      params = {
        :name => "Barbell Bench Press",
        :token => @user.token
      }

      get :search, :params => params
      json = JSON.parse(response.body)
      expected_json = ExerciseType.where(:name => params[:name]).as_json

      expect(json).to eq(expected_json)
    end
  end
end
