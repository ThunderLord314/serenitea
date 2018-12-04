class Order < ApplicationRecord
	has_many :order_products
	has_many :products, through: :order_products
	belongs_to :customer

	validates :customer, presence: true
	validates :date_ordered, presence: true
end
