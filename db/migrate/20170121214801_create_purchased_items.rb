class CreatePurchasedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :purchased_items do |t|
      t.integer     :item_type,  :null => false
      t.belongs_to  :user,       :null => false
      t.timestamps
    end
  end
end
