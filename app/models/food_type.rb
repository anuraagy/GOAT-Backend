class FoodType < ApplicationRecord
  validates :name,          :presence => true
  validates :calories,      :presence => true
  validates :serving_size,  :presence => true

end
