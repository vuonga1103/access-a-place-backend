class UsersController < ApplicationController
  before_action :authorized, only: [:persist]

  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: {error: @user.errors.full_messages}
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: {error: 'Invalid Email Or Password'}
    end
  end

  def persist
    token = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), token: token }
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
