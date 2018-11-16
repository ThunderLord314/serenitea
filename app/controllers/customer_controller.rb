class CustomerController < ApplicationController
	def new
		@provinces = Province.all
	end

	def create
		@customer = Customer.create(first_name: params[:customer][:first_name], 
									last_name: params[:customer][:last_name],
									address: params[:customer][:address],
									phone_number: params[:customer][:phone_number],
									email: params[:customer][:email],
									province_id: params[:customer][:province_id])
	end
end
