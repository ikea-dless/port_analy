class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :have_profile?

  private

  def have_profile?
    unless current_user.blank?
      if Profile.find_by(user_id: current_user).blank?
        flash[:alert] = 'プロフィールを入力してください'
        redirect_to new_user_profile_path(current_user)
      end
    end
  end
end
