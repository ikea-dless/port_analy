class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :profile_exist?, if: :user_signed_in?

  private

  def profile_exist?
    profile = Profile.find_by(user_id: current_user)
    redirect_to new_user_profile_path(current_user), flash: { alert: 'プロフィールを入力してください' } if profile.blank?
  end
end
