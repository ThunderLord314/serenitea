class ProductController < ApplicationController
	def index
		@product_collection = Product.order('category_id').page(params[:page]).per(5)
	end

	def show
		@product = Product.find(params[:id])
	end

	def search
		@product_collection = Product.where("category_id = ?", params[:category_id])
	end
end
