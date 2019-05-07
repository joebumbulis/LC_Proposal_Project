class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    @user.save
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :admin, :company_name, :note)
  end

end
