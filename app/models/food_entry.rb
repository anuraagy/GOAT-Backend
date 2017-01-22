class FoodEntry < ApplicationRecord
  validate :food_type, :presence => true
  validate :servings,  :presence => true
  validate :meal_type, :presence => true

  belongs_to :user
end
