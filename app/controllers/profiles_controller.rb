class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
    else
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
    params.require(:profile).permit(:message, :mattermost_times_url, :image)
  end
end
