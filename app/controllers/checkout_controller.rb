class CheckoutController < ApplicationController
	def index

	end

	def place_order
		# create an order associated with the customer
		order = Order.create(customer_id: 
							 total_price: 
							 date_ordered: )
		# create a product for each product ordered, that is associated with the order
		products.each do |product|
			order_product 
		end
	end
end
