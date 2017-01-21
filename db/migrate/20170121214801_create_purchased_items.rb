class CreatePurchasedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchased_items do |t|
      t.string :item_type, :null => false
      t.timestamps
    end
  end
end
