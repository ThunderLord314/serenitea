class AddTaxAmountToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tax_amount, :decimal
  end
end
