require 'rails_helper'

describe Api::V1::GoalsController, :type => :controller do
  before(:each) do
    user_params = {
      :email => "test@goat-app.com",
      :name  => "Goaty McGoatface",
      :password => "iamthegoat",
      :token => SecureRandom.base58(24)
    }
    @user = User.create(user_params)

    exercise_type_params = {
      :name => "Barbell Bench Press",
      :description => "A chest/shoulders exercise that works the entire upper body using a barbell."
    }
    @exercise_type = ExerciseType.create(exercise_type_params)
  end

  describe "POST #create" do
    it "Create a new goal" do
      params = {
        :name => "Hit 165lb on Bench Press",
        :exercise_type => @exercise_type.id,
        :goal_number   => 165,
        :current_value => 120,
        :user_id       => @user.id,
        :token         => @user.token
      }
      post :create, :params => params
      json = JSON.parse(response.body)

      expect(json["name"]).to           eq(params[:name])
      expect(json["exercise_type"]).to  eq(params[:exercise_type])
      expect(json["goal_number"]).to    eq(params[:goal_number])
      expect(json["current_value"]).to  eq(params[:current_value])
      expect(json["user_id"]).to        eq(params[:user_id])
    end
  end

  describe "PATCH #update" do
    it "Update a goal with patch" do
      create_params = {
        :name => "Hit 165lb on Bench Press",
        :exercise_type => @exercise_type.id,
        :goal_number   => 165,
        :current_value => 120,
        :user_id       => @user.id
      }

      @goal = Goal.create(create_params)

      update_params = {
        :id            => @goal.id,
        :name          => "Hit 225lb on Bench Press",
        :exercise_type => @exercise_type.id,
        :goal_number   => 225,
        :current_value => 165,
        :user_id       => @user.id,
        :token         => @user.token
      }

      patch :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["name"]).to           eq(update_params[:name])
      expect(json["exercise_type"]).to  eq(update_params[:exercise_type])
      expect(json["goal_number"]).to    eq(update_params[:goal_number])
      expect(json["current_value"]).to  eq(update_params[:current_value])
      expect(json["user_id"]).to        eq(update_params[:user_id])
    end
  end

  describe "PUT #update" do
    it "Update goal with put" do
      create_params = {
        :name => "Hit 165lb on Bench Press",
        :exercise_type => @exercise_type.id,
        :goal_number   => 165,
        :current_value => 120,
        :user_id       => @user.id
      }

      @goal = Goal.create(create_params)

      update_params = {
        :id            => @goal.id,
        :name          => "Hit 225lb on Bench Press",
        :exercise_type => @exercise_type.id,
        :goal_number   => 225,
        :current_value => 165,
        :user_id       => @user.id,
        :token         => @user.token
      }

      put :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["name"]).to           eq(update_params[:name])
      expect(json["exercise_type"]).to  eq(update_params[:exercise_type])
      expect(json["goal_number"]).to    eq(update_params[:goal_number])
      expect(json["current_value"]).to  eq(update_params[:current_value])
      expect(json["user_id"]).to        eq(update_params[:user_id])
    end
  end

  describe "GET #index" do
    it "Get specific user's goals" do
      params = {
        :user_id => @user.id,
        :token => @user.token
      }

      get :index, :params => params
      json = JSON.parse(response.body)
      expected_json = Goal.where(:user_id => @user.id).as_json

      expect(json).to eq(expected_json)
    end
  end

  describe "DELETE #destroy" do
    it "Destroy an exercise entry" do
      create_params = {
        :name => "Hit 165lb on Bench Press",
        :exercise_type => @exercise_type.id,
        :goal_number   => 165,
        :current_value => 120,
        :user_id       => @user.id
      }
      @goal = Goal.create(create_params)

      destroy_params = {
        :id => @goal.id,
        :token => @user.token
      }

      delete :destroy, :params => destroy_params
    end
  end
end
