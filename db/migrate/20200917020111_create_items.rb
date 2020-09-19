class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :non_taxed_price
      t.string :image_id
      t.boolean :is_active, default: false, null: false

      t.timestamps
    end
  end
end
