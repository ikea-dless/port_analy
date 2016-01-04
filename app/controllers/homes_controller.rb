class HomesController < ApplicationController
  def index
  end

  def search
    @activities = Activity.where('text like :q', q: "%#{params[:q]}%").order(created_at: :desc)
  end
end
