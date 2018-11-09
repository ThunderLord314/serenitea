class HomeController < ApplicationController
	def index
		@product_collection = Product.order("category")
	end
end
