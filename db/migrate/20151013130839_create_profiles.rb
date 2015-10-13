class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :image_url
      t.integer :deparment
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
