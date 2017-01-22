class ExerciseEntry < ApplicationRecord
  validate :exercise_type,   :presence => true
  validate :num_repetitions, :presence => true
  validate :weight,          :presence => true

  belongs_to :user
end
