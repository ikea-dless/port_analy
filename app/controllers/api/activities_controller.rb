class Api::ActivitiesController < ApplicationController
  skip_before_action :have_profile?
  def show
    activity = Activity.find_or_initialize_by(id: params[:id])
    kit_words = Analy.tokenize(activity.text)
    @kit_dic = KitDictionary.where(word: kit_words)
  end
end
