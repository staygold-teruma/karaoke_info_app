class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :content
      t.string :image
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
