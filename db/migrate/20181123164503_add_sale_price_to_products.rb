class AddSalePriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale_price, :decimal
  end
end
