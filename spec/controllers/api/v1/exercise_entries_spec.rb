require 'rails_helper'

describe Api::V1::ExerciseEntriesController, :type => :controller do
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
    it "Create a new exercise entry" do
      params = {
        :exercise_type   => "#{@exercise_type.id}",
        :num_repetitions => 10,
        :weight          => 135,
        :user_id         => @user.id,
        :token           => @user.token
      }
      post :create, :params => params
      json = JSON.parse(response.body)

      expect(json["exercise_type"]).to    eq(params[:exercise_type])
      expect(json["num_repetitions"]).to  eq(params[:num_repetitions])
      expect(json["weight"]).to           eq(params[:weight])
      expect(json["user_id"]).to          eq(params[:user_id])
    end
  end

  describe "PATCH #update" do
    it "Update exercise entry with patch" do
      create_params = {
        :exercise_type   => "#{@exercise_type.id}",
        :num_repetitions => 10,
        :weight          => 135,
        :user_id         => @user.id
      }
      @exercise = ExerciseEntry.create(create_params)

      update_params = {
        :id              => @exercise.id,
        :exercise_type   => "#{@exercise_type.id}",
        :num_repetitions => 5,
        :weight          => 155,
        :user_id         => @user.id,
        :token           => @user.token
      }

      patch :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["exercise_type"]).to    eq(update_params[:exercise_type])
      expect(json["num_repetitions"]).to  eq(update_params[:num_repetitions])
      expect(json["weight"]).to           eq(update_params[:weight])
      expect(json["user_id"]).to          eq(update_params[:user_id])
    end
  end

  describe "PUT #update" do
    it "Update exercise entry with patch" do
      create_params = {
        :exercise_type   => "#{@exercise_type.id}",
        :num_repetitions => 10,
        :weight          => 135,
        :user_id         => @user.id
      }
      @exercise = ExerciseEntry.create(create_params)

      update_params = {
        :id              => @exercise.id,
        :exercise_type   => "#{@exercise_type.id}",
        :num_repetitions => 5,
        :weight          => 155,
        :user_id         => @user.id,
        :token           => @user.token
      }

      put :update, :params => update_params
      json = JSON.parse(response.body)

      expect(json["exercise_type"]).to    eq(update_params[:exercise_type])
      expect(json["num_repetitions"]).to  eq(update_params[:num_repetitions])
      expect(json["weight"]).to           eq(update_params[:weight])
      expect(json["user_id"]).to          eq(update_params[:user_id])
    end
  end

  describe "GET #index" do
    it "Get specific exercise entries" do
      params = {
        :user_id => @user.id,
        :token => @user.token
      }

      get :index, :params => params
      json = JSON.parse(response.body)
      expected_json = ExerciseEntry.where(:user_id => @user.id).as_json

      expect(json).to eq(expected_json)
    end
  end

  describe "DELETE #destroy" do
    it "Destroy an exercise entry" do
      create_params = {
        :exercise_type   => "#{@exercise_type.id}",
        :num_repetitions => 10,
        :weight          => 135,
        :user_id         => @user.id
      }
      @exercise = ExerciseEntry.create(create_params)

      destroy_params = {
        :id => @exercise.id,
        :token => @user.token
      }

      delete :destroy, :params => destroy_params
    end
  end
end
