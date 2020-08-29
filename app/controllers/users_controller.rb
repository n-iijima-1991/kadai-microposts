class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
