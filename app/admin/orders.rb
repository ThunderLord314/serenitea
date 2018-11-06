ActiveAdmin.register Order do
	permit_params :customer, :total_price, :date_ordered
end
