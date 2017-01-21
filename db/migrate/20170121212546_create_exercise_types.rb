class CreateExerciseTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_types do |t|
      t.string :name,         :null => false
      t.string :description,  :null => false
      t.timestamps
    end
  end
end
