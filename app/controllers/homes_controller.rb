class HomesController < ApplicationController
  def index
    render layout: false
  end

  def search
    @activities = Activity.where('text like :q', q: "%#{params[:q]}%").order(created_at: :desc)
  end
end
