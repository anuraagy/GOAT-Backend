class Api::V1::UsersController < ApplicationController
  skip_before_action :authenicate_token?

  def create
    user = User.new(user_params)
    token = SecureRandom.base58(24)

    if User.find_by(:token => token).nil?
      token = SecureRandom.base58(24)
    end
    user.token = token

    if user.save
      render :json => user.as_json(:token => user.token, :email => user.email)
    else
      render :json => user.errors.as_json
    end
  end

  def sign_in
    email = params[:email]
    password = params[:password]

    user = User.find_by_email(params[:email])

    if user.nil?
      if user.valid_password(password)
        render :json => { :success => true, :email => user.email, :token => user.token }
      else
        render :json => { :success => false, :message => "Invalid email or password submitted" }
      end
    else
      render :json => { :success => false, :message => "Invalid email or password submitted" }
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password)
  end

  def user_sign_in_params
    params.permit(:email, :password)
  end
end
