class Api::V1::ExerciseEntriesController < Api::V1::BaseController
  def index
    exercise_entries = ExerciseEntry.where(exercise_params)
    render :json => exercise_entries.as_json
  end

  def create
    exercise_entry = ExerciseEntry.new(exercise_params)

    if exercise_entry.save
      render :json => exercise_entry.as_json
    else
      render :json => exercise_entry.errors.as_json
    end
  end

  def update
    exercise_entry = ExerciseEntry.find(params[:id])

    if exercise_entry.update(exercise_params)
      render :json => exercise_entry.as_json
    else
      render :json => exercise_entry.errors.as_json
    end
  end

  def destroy
    exercise_entry = ExerciseEntry.find(params[:id])

    if exercise_entry.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end

  private

  def exercise_params
    params.permit(:id, :exercise_type, :num_repetitions, :weight, :user_id)
  end
end
