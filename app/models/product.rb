class Product < ApplicationRecord
	mount_uploader :image, ImageUploader

	has_many :order_products
	has_many :orders, through: :order_products

	validates :name, presence: true, uniqueness: true
	validates :price, presence: true
end
