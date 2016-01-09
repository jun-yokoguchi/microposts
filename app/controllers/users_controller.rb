class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy,:following, :followers]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
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
  
  def followings
    @title = "Followings"
    @user = User.find(params[:id])
    @followings_user = followings(params[:id])
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @followers_user = followers(params[:followers_id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
