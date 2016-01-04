class KitDictionary < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :introduction, presence: true, uniqueness: true
end
