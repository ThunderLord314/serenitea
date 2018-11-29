class ProductController < ApplicationController
	require 'date'
	# Shows a list of all of the products, or if a search is submitted, products that match the search
	def index
		if params[:category].present?
			filter_sql = sql_by_id(params[:filter])
			@product_collection = Product.where(filter_sql, 
												cat: params[:category][:category_id], 
												text: "%" << params[:text] << "%"
												).page(params[:page]).per(5)
		else 
			@product_collection = Product.order('category_id').page(params[:page]).per(5)
		end
	end

	# Shows an individual product
	def show
		@product = Product.find(params[:id])
	end

	# returns the sql for the filter that is selected
	def sql_by_id(id)
		sql = "category_id = :cat AND (description LIKE :text OR name LIKE :text)"
		if id == "2"
			sql << " AND sale_price != 0 AND price - sale_price > 0"
		end
		if id == "3"
			current_date = Date.today().prev_day(14).strftime('%Y-%m-%d %H-%M-%S')
			sql << " AND created_at >= \'" << current_date << "\'"
		end
		return sql
	end
end
