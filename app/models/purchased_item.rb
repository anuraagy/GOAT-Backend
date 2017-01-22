class PurchasedItem < ApplicationRecord
  validate :item_type, :presence => true

  belongs_to :user
end
