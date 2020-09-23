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

  def oauth_login
    @user = User.find_by(email: params[:email])
    
    if !@user 
      @user = User.create(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], image_url: params[:image_url], password: Passgen::generate)
    end

    # in case the user change their facebook or google details
    @user.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], image_url: params[:image_url])

    token = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), token: token }
  end

  def persist
    token = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), token: token }
  end

  def show
    if @user = User.find_by(id: params[:id])
      render json: @user
    else
      render json: { error: "No user with that id exists"}
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
