class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to root_path
    else
      render new
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
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
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
