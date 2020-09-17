class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :count
      t.integer :taxed_price
      t.string :making_status

      t.timestamps
    end
  end
end
