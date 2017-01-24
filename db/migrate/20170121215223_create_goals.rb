class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string       :name,           :null => false
      t.integer      :exercise_type,  :null => false
      t.integer      :goal_number,    :null => false
      t.integer      :current_value,  :null => false
      t.belongs_to   :user,           :null => false
      t.timestamps
    end
  end
end
