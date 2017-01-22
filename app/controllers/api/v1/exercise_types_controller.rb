class Api::V1::ExerciseTypesController < Api::V1::BaseController
  def index
    exercise_types = ExerciseType.all
    render :json => exercise_types.as_json
  end

  def create
    exercise_type = ExerciseType.new(exercise_params)

    if exercise_type.save
      render :json => exercise_type.as_json
    else
      render :json => exercise_type.errors.as_json
    end
  end

  def search
    exercise_types = ExerciseType.where(food_params)
    render :json => exercise_types.as_json
  end

  private

  def exercise_params
    params.permit(:id, :name, :description)
  end
end
