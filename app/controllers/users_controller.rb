class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :show, :destroy]
  before_action :check_user_is_admin, only: [:destroy]
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = Uesr.new(user_params)
    if user.save
      login(@user)
      redirect_to root_path, flash: {success: "Welcome to music label"}
    else
      render "new"
    end
  end

  def edit
  end

  def update

  
  private

  def user_params
    params.require(:user).permit(:name, :email, :mobile, :password, :confirm_password)
  end

  def set_user
    @user = User.find([:id])
end
