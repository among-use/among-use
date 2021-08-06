class UsersController < ApplicationController
  # skip_before_action :require_login, only: %i[new create]
  before_action :user_set, only: %i[show edit update]
  include ActiveModel::Model
  include Pagy::Backend

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
    @pagy, @users = pagy(User.all)
  end

  def show; end

  def edit; end

  def update
    @user_form = UserForm.new(update_params)
    if @user_form.valid?
      @user_form.update
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def user_set
    @user = User.find(params[:id])
  end

  def update_params
    params.permit(:name, :message, :mattermost_times_url, :id)
  end
end

