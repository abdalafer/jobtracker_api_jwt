class UsersController < ApplicationController
  before_filter :authenticate!, except: [:index, :create]
  before_action :set_user, only: [:show, :update, :destroy]

  #TODO Warden JWT
  #http://blog.maestrano.com/rails-api-authentication-with-warden-without-devise/
  #https://medium.com/@goncalvesjoao/rails-devise-jwt-and-the-forgotten-warden-67cfcf8a0b73#.ocjbhzpa6

  #implement authentication without devise, using warden
  # modify warden authentication to have a strategy for json web token

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    #User.authenticate(user_params[:email], user_params[:password])

    render json: current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
end
