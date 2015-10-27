class CreateKitDictionaries < ActiveRecord::Migration
  def change
    create_table :kit_dictionaries do |t|
      t.string :word, null: false
      t.string :introduction, null: false

      t.timestamps null: false
    end
  end
end
