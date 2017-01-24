class PurchasedItem < ApplicationRecord
  validates :item_type, :presence => true

  belongs_to :user
end
