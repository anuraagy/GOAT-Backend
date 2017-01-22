class Api::V1::ItemTypesController < Api::V1::BaseController
  def index
    item_types = ItemType.all
    render :json => item_types.as_json
  end
end
