class Api::V1::GoalsController < Api::V1::BaseController
  def index
    goals = Goal.where(goal_params)
    render :json => goals.as_json
  end

  def create
    goal = Goal.new(food_params)

    if goal.save
      render :json => goal.as_json
    else
      render :json => goal.errors.as_json
    end
  end

  def update
    goal = Goal.find(params[:id])

    if goal.update(goal_params)
      render :json => goal.as_json
    else
      render :json => goal.errors.as_json
    end
  end

  def destroy
    goal = Goal.find(params[:id])

    if goal.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end

  private

  def goal_params
    params.permit(:id, :name, :exercise_type, :description, :goal_number, :current_value, :user_id)
  end
end
