class CreateKitDictionaries < ActiveRecord::Migration
  def change
    create_table :kit_dictionaries do |t|
      t.string :word
      t.string :introduction

      t.timestamps null: false
    end
  end
end
