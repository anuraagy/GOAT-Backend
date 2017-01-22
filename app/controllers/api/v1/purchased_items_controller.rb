class Api::V1::PurchasedItemsController < Api::V1::BaseController
  def index
    purchased_items = PurchasedItem.where(purchased_item_params)
    render :json => purchased_items.as_json
  end

  def create
    purchased_item = PurchasedItem.new(purchased_item_params)

    if purchased_item.save
      render :json => purchased_item.as_json
    else
      render :json => purchased_item.errors.as_json
    end
  end

  private

  def purchased_item_params
    params.permit(:item_type, :user_id)
  end
end
