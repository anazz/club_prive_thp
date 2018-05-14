class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    #redirect_to users_path
  end  
    
  def create
    user = User.create(user_params)
    redirect_to user_path(user.id)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password)
  end  
end
