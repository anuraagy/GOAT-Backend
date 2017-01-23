class FoodEntry < ApplicationRecord
  validates :food_type, :presence => true
  validates :servings,  :presence => true
  validates :meal_type, :presence => true

  belongs_to :user

  def food_information
    FoodType.find_by(:name => food_type)
  end
end
