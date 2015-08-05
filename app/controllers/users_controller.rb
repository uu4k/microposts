class UsersController < ApplicationController
  before_action :correct_user, only: [:edit,:update]
  def show
   @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Setting updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:profile,:location)
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
