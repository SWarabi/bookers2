

class UsersController < ApplicationController
  before_action :authenticate_user!
  # 個別指定
  # before_action :authenticate_user!, only: [:edit, :update, :show, :index]
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books  
    # @post_images = @user.post_images.page(params[:page])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render :edit
    end
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all 
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end