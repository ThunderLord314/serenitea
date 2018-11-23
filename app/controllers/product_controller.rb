class ProductController < ApplicationController
	require 'date'
	# Shows a list of all of the products, or if a search is submitted, products that match the search
	def index
		@product_collection = Product.order('category_id').page(params[:page]).per(5)
		if params[:category].present?
			sql = filter_sql(:filter)
			@product_collection = Product.where(sql, 
												cat: params[:category][:category_id], 
												text: "%" << params[:text] << "%"
												).page(params[:page]).per(5)
		end
	end

	# Shows an individual product
	def show
		@product = Product.find(params[:id])
	end

	# returns the sql for the filter that is selected
	def filter_sql(id)
		current_date = Date.today().prev_day(14).strftime('%Y-%m-%d %H-%M-%S')
		filter_sql = "category_id = :cat AND (description LIKE :text OR name LIKE :text)"
		if id == "2"
			filter_sql << " AND sale_price != 0 AND price - sale_price > 0"
		end
		if id == "3"
			filter_sql << " AND created_at >= \'" << current_date << "\'"
		end
	end
end
