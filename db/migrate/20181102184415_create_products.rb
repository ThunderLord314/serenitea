class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :quantity
      t.decimal :price
      t.string :image
      t.string :shipping_info

      t.timestamps
    end
  end
end
