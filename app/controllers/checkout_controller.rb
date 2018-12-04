class CheckoutController < ApplicationController
	def index
		@provinces = Province.all
		@amount = session[:total]
		@description = 'Serenitea Online Purchase'
	end

	def new
		
	end

	def create
		amount = session[:total]
		@stripe_cust = Stripe::Customer.create(email: params[:customer][:email],
												source: params[:stripeToken])

		@stripe_charge = Stripe::Charge.create(customer: @stripe_cust.id,
												amount: amount,
												description: '',
												currency: 'cad')

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_checkout_path
		end

		@customer = Customer.find_or_create_by(first_name: params[:customer][:first_name], 
												last_name: params[:customer][:last_name],
												address: params[:customer][:address],
												phone_number: params[:customer][:phone_number],
												email: params[:customer][:email],
												province_id: params[:customer][:province_id])

		@order = Order.create(customer_id: @customer.id,
							  total_price: amount,
							  date_ordered: Date.today().strftime('%Y-%m-%d %H-%M-%S')
							  status: @stripe_charge.paid == true ? "paid" : "unpaid")

		session[:cart].keys.each do |id|
			OrderProduct.create(order_id: @order.id,
								product_id: id,
								quantity: session[:cart][id]['quantity'])
		end
	end
end
