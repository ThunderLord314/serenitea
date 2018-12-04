class CheckoutController < ApplicationController
	def index
		@provinces = Province.all
		@amount = ""
		@description = 'Serenitea Online Purchase'
	end

	def new
		
	end

	def create
		tax_rate = Province.find(params[:customer][:province_id]).combined_tax_rate
		subtotal = session[:subtotal]
		tax_amount = (tax_rate * subtotal / 100).to_i
		amount = (subtotal + tax_amount).to_i
		@cart = session[:cart]

		@customer = Customer.find_or_create_by(first_name: params[:customer][:first_name], 
												last_name: params[:customer][:last_name],
												address: params[:customer][:address],
												phone_number: params[:customer][:phone_number],
												email: params[:customer][:email],
												province_id: params[:customer][:province_id])

		@order = Order.create(customer_id: @customer.id,
							  tax_rate: tax_rate,
							  tax_amount: tax_amount,
							  subtotal: subtotal,
							  total_price: amount,
							  date_ordered: Date.today().strftime('%Y-%m-%d %H-%M-%S'),
							  status: "paid")

		session[:cart].keys.each do |id|
			OrderProduct.create(order_id: @order.id,
								product_id: id,
								quantity: session[:cart][id]['quantity'],
								price: session[:cart][id]['price'])
		end

		session[:cart] = Hash.new 
		session[:subtotal] = Hash.new 

		@stripe_cust = Stripe::Customer.create(email: params[:stripeEmail],
												source: params[:stripeToken])

		@stripe_charge = Stripe::Charge.create(customer: @stripe_cust.id,
												amount: amount,
												description: '',
												currency: 'cad')

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_checkout_path

	end
end
