class UsersController < ApplicationController
  before_action :authorized, only: [:persist, :destroy, :update]

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

  def show
    if @user = User.find_by(id: params[:id])
      render json: @user
    else
      render json: { error: "No user with that id exists"}
    end
  end

  def num_reviews
    if @user = User.find_by(id: params[:id])
      render json: @user.reviews.count
    else
      render json: { error: "No user with that id exists"}
    end
  end

  def get_authorization
    # Use token sent in from frontend to fetch user information 
    url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params[:id_token]}"                  
    response = HTTParty.get(url).parsed_response  

    email = response["email"]
    first_name = response["given_name"] || ""
    last_name = response["family_name"] || ""
    image_url = response["picture"] || ""

    user = User.find_by(email: email)

    if !user 
      user = User.create(email: email, first_name: first_name, last_name: last_name, image_url: image_url, password: Passgen::generate) # Random password generated for user who logs in via Google
    end

    # In case the user changes their google details
    user.update(email: email, first_name: first_name, last_name: last_name, image_url: image_url)

    token = encode_token({user_id: user.id})
    
    render json: { user: UserSerializer.new(user), token: token }
  end

  def destroy
    @user.destroy
    render json: @user
  end

  def update
    @user.update(email: params[:email], password: params[:password])
    token = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), token: token }
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
