class ApplicationController < ActionController::Base
	before_action :load_categories
	before_action :initialize_session

	# Adds a product to the cart, or if it already exists, increment it by one
	def add_to_cart
		cart_hash = session[:cart]
		product = find_key(cart_hash, params[:id])
		product[:quantity] += 1
		cart_hash[params[:id]] = product

		redirect_to root_url
	end

	# Decrements the quantity on an item in the cart, and removes it when it's 0
	def remove_from_cart
		cart_hash = session[:cart]

		cart_hash[params[:id]]["quantity"] -= 1
		if cart_hash[params[:id]]["quantity"] === 0
			cart_hash.delete(params[:id])
		end

		redirect_to root_url
	end

	# Removes an item from the shopping cart
	def clear_item_from_cart
		cart_hash = session[:cart]

		redirect_to root_url
	end

	# Empties the cart
	def clear_cart
		session[:cart] = Hash.new

		redirect_to root_url
	end



	private
	def initialize_session
		session[:cart] ||= Hash.new
	end

	def load_categories
		@categories = Category.all
	end

	# Helper for add_to_cart to locate an id on the session[:cart] hash or create one if there isn't
	def find_key(hash, key)
		product = {}
		if hash.key?(key)
			product[:quantity] = hash[key]["quantity"]
			product[:price] = hash[key]["price"]
		else
			product[:quantity] ||= 0
			product[:price] = Product.find(key).sale_price.present? ? Product.find(key).sale_price : Product.find(key).price
		end
		return product
	end
end
