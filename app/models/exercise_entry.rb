class ExerciseEntry < ApplicationRecord
  validates :exercise_type,   :presence => true
  validates :num_repetitions, :presence => true
  validates :weight,          :presence => true

  belongs_to :user
end
