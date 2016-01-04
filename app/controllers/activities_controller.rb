class ActivitiesController < ApplicationController
  before_action :authenticate_user!, except: :show

  def create
    @activity = current_user.build_activity(activity_params)
    if @activity.save
      redirect_to user_activity_path, flash: { success: '保存しました' }
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find_or_initialize_by(user_id: current_user)
    redirect_to new_user_activity_path unless @activity.text
  end

  def index
    @activity = Activity.find_or_initialize_by(user_id: current_user)
    redirect_to new_user_activity_path unless @activity.text
  end

  def update
    @activity = Activity.find_by(user_id: current_user)
    if @activity.update_attributes(activity_params)
      redirect_to user_activity_path, flash: { success: '更新しました' }
    else
      render 'edit'
    end
  end

  def new
    @activity = Activity.find_or_initialize_by(user_id: current_user)
    redirect_to edit_user_activity_path if @activity.text
  end

  def destroy
  end

  def show
    @activity = Activity.find_by(id: params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:text)
  end
end
