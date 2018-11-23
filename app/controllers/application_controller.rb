class ApplicationController < ActionController::Base
	before_action :load_categories
	before_action :initialize_session

	private
	def initialize_session
		session[:cart] ||= Hash.new
	end

	# Returns a collection based on the id's of the hash
	def load_cart
		@cart = Product.find(session[:cart])
	end

	def load_categories
		@categories = Category.all
	end
end
