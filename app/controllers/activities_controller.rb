class ActivitiesController < ApplicationController
  before_action :authenticate_user!, except: :show

  def create
    @activity = current_user.build_activity(activity_params)
    if @activity.save
      flash[:success] = '保存しました'
      redirect_to user_activity_path
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find_by(user_id: current_user)
    redirect_to new_user_activity_path if @activity.nil?
  end

  def index
    @activity = Activity.find_by_user_id(current_user)
    redirect_to new_user_activity_path if @activity.blank?
  end

  def update
    if current_user.activity.update(activity_params)
      flash[:notice] = '保存しました'
      redirect_to user_activity_path
    else
      render 'edit'
    end
  end

  def new
    @activity = Activity.find_or_initialize_by(user_id: current_user)
    redirect_to edit_user_activity_path unless @activity.nil?
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
