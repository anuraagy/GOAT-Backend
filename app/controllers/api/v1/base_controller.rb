class Api::V1::BaseController < ApplicationController
  before_filter :authenticate_token?

  def authenticate_token?
    # @user = User.find_by(:token => params[:token])
    # if @user.nil?
    #   render :json => "401 Unauthorized"
    # end
  end
end
