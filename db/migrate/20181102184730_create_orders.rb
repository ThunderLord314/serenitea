class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :customer_id
      t.decimal :total_price
      t.datetime :date_ordered

      t.timestamps
    end
  end
end
