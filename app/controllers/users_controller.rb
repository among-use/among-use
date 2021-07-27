class UsersController < ApplicationController
  # skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path # 後でリダイレクト先を変更
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    @profile = user.build_profile(user_params)
    if @profile.update
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
