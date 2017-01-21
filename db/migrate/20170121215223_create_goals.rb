class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :name,           :null => false
      t.string :exercise_type,  :null => false
      t.string :description,    :null => false
      t.string :goal_number,    :null => false
      t.string :current_value,  :null => false
      t.timestamps
    end
  end
end
