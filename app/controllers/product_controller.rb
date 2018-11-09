class ProductController < ApplicationController
	def index
		@product_collection = Product.order('category').page(params[:page]).per(5)
	end
	def show
		@product = Product.find(params[:id])
	end
end
