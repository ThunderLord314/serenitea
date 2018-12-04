class AddTaxRateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tax_rate, :decimal
  end
end
