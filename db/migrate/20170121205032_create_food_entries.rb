class CreateFoodEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :food_entries do |t|
      t.string      :food_type,  :null => false
      t.integer     :servings,   :null => false
      t.string      :meal_type,  :null => false
      t.belongs_to  :user,       :null => false
      t.timestamps
    end
  end
end
