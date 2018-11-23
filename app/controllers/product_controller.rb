class ProductController < ApplicationController
	# Shows a list of all of the products, or if a search is submitted, products that match the search
	def index
		@product_collection = Product.order('category_id').page(params[:page]).per(5)
		if params[:category].present?
			@product_collection = Product.where("category_id = :cat AND (description LIKE :text OR name LIKE :text)", 
												cat: params[:category][:category_id], 
												text: "%" << params[:text] << "%"
												).page(params[:page]).per(5)
		end
	end

	# Shows an individual product
	def show
		@product = Product.find(params[:id])
	end

	# Brings you to a checkout screen
	def checkout
		
	end

	# Adds a product to the cart, or if it already exists, increment it by one
	def add_to_cart
		cart_hash = session[:cart]
		product = {}
		# If there is already a cart item present, increment it, otherwise create it
		if cart_hash.key?(params[:id])
			product[:quantity] = cart_hash[params[:id]]["quantity"]
			product[:price] = cart_hash[params[:id]]["price"]
		else
			product[:quantity] ||= 0
			product[:price] = Product.find(params[:id]).price
		end
		product[:quantity] += 1
		# save the updated hash
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
end
