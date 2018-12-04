class CheckoutController < ApplicationController
	def index
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
	end
end
