class Order < ApplicationRecord
	has_many :order_products
	has_many :products, through: :order_products
	belongs_to :customers

	validates :customer, presence: true
	validates :order_placed, presence: true
end
