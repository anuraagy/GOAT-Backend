class Api::V1::FoodTypesController < Api::V1::BaseController
  def index
    food_types = FoodType.all
    render :json => food_types.as_json
  end

  def create
    food_type = FoodType.new(food_params)

    if food_type.save
      render :json => food_type.as_json
    else
      render :json => food_type.errors.as_json
    end
  end

  def update
    food_type = FoodType.find(params[:id])

    if food_type.update(food_params)
      render :json => food_type.as_json
    else
      render :json => food_type.errors.as_json
    end
  end

  def search
    food_types = FoodType.where(food_params)
    render :json => food_types.as_json
  end

  private

  def food_params
    params.permit(:id,
                  :name,
                  :calories,
                  :serving_size,
                  :calories,
                  :fat,
                  :carbohydrates,
                  :protein,
                  :sugar,
                  :cholesterol,
                  :sodium,
                  :potassium,
                  :saturated_fat,
                  :trans_fat,
                  :vitamin_a,
                  :vitamin_c,
                  :vitamin_d,
                  :calcium,
                  :iron)
  end
end
