class Goal < ApplicationRecord
  validate :name,           :presence => true
  validate :exercise_type,  :presence => true
  validate :description,    :presence => true
  validate :goal_number,    :presence => true
  validate :current_value,  :presence => true

  belongs_to :user
end
