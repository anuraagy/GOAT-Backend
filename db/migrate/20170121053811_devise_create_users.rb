class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      # Custom Auth
      t.string  :name,     null: false
      t.string  :token,    null: false

      # Attributes
      t.integer :level,    default: 0, null: false
      t.integer :speed,    default: 0, null: false
      t.integer :strength, default: 0, null: false
      t.integer :stamina,  default: 0, null: false
      t.integer :xp,       default: 0, null: false
      t.integer :coins,    default: 0, null: false

      # Goals
      t.integer  :caloric_goal
      t.integer  :fat_goal
      t.integer  :carbohydrates_goal
      t.integer  :protein_goal
      t.integer  :sugar_goal
      t.integer  :cholesterol_goal
      t.integer  :sodium_goal
      t.integer  :potassium_goal
      t.integer  :saturated_fat_goal
      t.integer  :trans_fat_goal
      t.integer  :vitamin_a_goal
      t.integer  :vitamin_c_goal
      t.integer  :vitamin_d_goal
      t.integer  :calcium_goal
      t.integer  :iron_goal

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
