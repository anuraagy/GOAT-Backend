class Goal < ApplicationRecord
  validates :name,           :presence => true
  validates :exercise_type,  :presence => true
  validates :description,    :presence => true
  validates :goal_number,    :presence => true
  validates :current_value,  :presence => true

  belongs_to :user
end
