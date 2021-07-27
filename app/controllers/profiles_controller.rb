class ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      flash[:success] = "さくせす"
    else
      flash[:danger] = "失敗"
    end
  end

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy!
  end

  private

  def profile_params
    params.require(:profile).permit(:message, :mattermost_times_url, :image).merge(user_id: current_user.id)
  end
end