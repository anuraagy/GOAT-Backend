class FoodType < ApplicationRecord
  validate :name,          :presence => true
  validate :calories,      :presence => true
  validate :serving_size,  :presence => true

end
