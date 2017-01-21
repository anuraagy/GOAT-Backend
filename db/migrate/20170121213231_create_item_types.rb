class CreateItemTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :item_types do |t|
      t.string  :name,         :null => false
      t.string  :description,  :null => false
      t.string  :image,        :null => false
      t.integer :value,        :null => false
      t.timestamps
    end
  end
end
