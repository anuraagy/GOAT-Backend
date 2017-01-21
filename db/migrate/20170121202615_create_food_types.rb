class CreateFoodTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :food_types do |t|
      t.string   :name,          :null => false
      t.string   :serving_size,  :null => false
      t.integer  :calories,      :null => false
      t.integer  :fat
      t.integer  :carbohydrates
      t.integer  :protein
      t.integer  :sugar
      t.integer  :cholesterol
      t.integer  :sodium
      t.integer  :potassium
      t.integer  :saturated_fat
      t.integer  :trans_fat
      t.integer  :vitamin_a
      t.integer  :vitamin_c
      t.integer  :vitamin_d
      t.integer  :calcium
      t.integer  :iron
      t.timestamps
    end
  end
end
