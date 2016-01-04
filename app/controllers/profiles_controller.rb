class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: :show
  skip_before_action :profile_exist?, only: [:new, :create]
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to user_profile_path, flash: { success: '保存しました' }
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find_or_initialize_by(user_id: current_user)
  end

  def index
    @profile = Profile.find_by(user_id: current_user)
  end

  def update
    @profile = Profile.find_by(user_id: current_user)
    if @profile.update_attributes(profile_params)
      redirect_to user_profile_path, flash: { success: '更新しました' }
    else
      render 'edit'
    end
  end

  def new
    @profile = Profile.find_or_initialize_by(user_id: current_user)
    redirect_to edit_user_profile_path if @profile.name
  end

  def destroy
  end

  def show
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :image_url, :department)
  end
end
