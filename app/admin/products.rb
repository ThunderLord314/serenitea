ActiveAdmin.register Product do
	permit_params :name, :description, :quantity, :price, :image, :shipping_info
end
