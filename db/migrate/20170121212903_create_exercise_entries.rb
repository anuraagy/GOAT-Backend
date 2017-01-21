class CreateExerciseEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_entries do |t|
      t.string   :exercise_type,    :null => false
      t.integer  :num_repetitions,  :null => false
      t.float    :weight,           :null => false
      t.timestamps
    end
  end
end
