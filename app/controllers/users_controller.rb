class UsersController < ApplicationController
  # skip_before_action :require_login, only: %i[new create]
  before_action :user_set, only: %i[show edit update]
  include Pagy::Backend

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      flash[:notice] = 'ユーザー登録に成功しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  def index
    @pagy, @users = pagy(User.all)
  end

  def show; end

  def edit; end

  def update
    @profile = @user.build_profile(user_params)
    if @profile.update
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_set
    @user = User.find(params[:id])
  end
end
