class CheckoutController < ApplicationController
	def index
		@provinces = Province.all
	end

	def new
		# create an order associated with the customer
		customer = Customer.find(4)
		
		# create a product for each product ordered, that is associated with the order
		session[:cart].each do |product|
			
		end
		redirect_to checkout_index_path
	end

	def create
		@customer = Customer.find_or_create_by(first_name: params[:customer][:first_name], 
												last_name: params[:customer][:last_name],
												address: params[:customer][:address],
												phone_number: params[:customer][:phone_number],
												email: params[:customer][:email],
												province_id: params[:customer][:province_id])

		@order = Order.create(customer_id: @customer.id,
							  total_price: session[:total],
							  date_ordered: Date.today().strftime('%Y-%m-%d %H-%M-%S'))

		session[:cart].each do |id|
			OrderProduct.create(order_id: @order.id,
								product_id: id,
								quantity: session[:cart][id]['quantity'])
		end

		session[:cart] = Hash.new

	end
end
