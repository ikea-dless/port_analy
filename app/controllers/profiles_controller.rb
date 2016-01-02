class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: :show
  skip_before_action :have_profile?, only: [:new, :create]
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = '保存しました'
      redirect_to user_profile_path
    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @profile = Profile.find_by(user_id: current_user)
  end

  def update
  end

  def new
    @profile = Profile.find_or_initialize_by(user_id: current_user)
    redirect_to edit_user_profile_path unless @profile
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
