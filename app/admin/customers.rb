ActiveAdmin.register Customer do
	permit_params :first_name, :last_name, :address, :phone_number, :email, :province_id
end
