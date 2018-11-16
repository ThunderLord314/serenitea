class AddProvinceIdToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :province_id, :decimal
  end
end
