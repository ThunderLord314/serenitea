class ProductController < ApplicationController
	def index
		@product_collection = Product.order('category_id').page(params[:page]).per(5)
		if params[:category].present?
			@product_collection = Product.where("category_id = :cat AND (description LIKE :text OR name LIKE :text)", 
												cat: params[:category][:category_id], 
												text: "%" << params[:text] << "%"
												).page(params[:page]).per(5)
		end
	end

	def show
		@product = Product.find(params[:id])
	end
end
