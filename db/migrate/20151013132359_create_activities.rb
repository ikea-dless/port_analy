class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
