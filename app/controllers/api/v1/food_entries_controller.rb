class Api::V1::FoodEntriesController < Api::V1::BaseController
  def index
    food_entries = FoodEntry.where(food_params)
    render :json => food_entries.as_json
  end

  def create
    food_entry = FoodEntry.new(food_params)

    if food_entry.save
      render :json => food_entry.as_json
    else
      render :json => food_entry.errors.as_json
    end
  end

  def update
    food_entry = FoodEntry.find(params[:id])

    if food_entry.update(food_params)
      render :json => food_entry.as_json
    else
      render :json => food_entry.errors.as_json
    end
  end

  def destroy
    food_entry = FoodEntry.find(params[:id])

    if food_entry.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end

  private

  def food_params
    params.permit(:id, :food_type, :servings, :meal_type, :user_id)
  end
end
