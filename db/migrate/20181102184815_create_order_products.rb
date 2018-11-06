class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.decimal :order
      t.decimal :product
      t.decimal :quantity

      t.timestamps
    end
  end
end
