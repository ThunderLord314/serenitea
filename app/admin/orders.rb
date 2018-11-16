ActiveAdmin.register Order do
	permit_params :customer_id, :total_price, :date_ordered
end
