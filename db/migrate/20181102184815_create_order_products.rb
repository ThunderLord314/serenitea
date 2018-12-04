class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.decimal :order_id
      t.decimal :product_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
