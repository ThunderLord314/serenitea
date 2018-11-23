# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Purging Database..."
Product.delete_all
Category.delete_all
AdminUser.delete_all
Province.delete_all

puts "Creating Provinces..."
Province.create(name: 'Alberta', abbreviation: "AB", combined_tax_rate: '5')
Province.create(name: 'British Columbia', abbreviation: "BC", combined_tax_rate: '12')
Province.create(name: 'Manitoba', abbreviation: "MB", combined_tax_rate: '13')
Province.create(name: 'New-Brunswick', abbreviation: "NB", combined_tax_rate: '15')
Province.create(name: 'Newfoundland and Labrador', abbreviation: "NL", combined_tax_rate: '15')
Province.create(name: 'Northwest Territories', abbreviation: "NT", combined_tax_rate: '5')
Province.create(name: 'Nova Scotia', abbreviation: "NS", combined_tax_rate: '15')
Province.create(name: 'Nunavut', abbreviation: "NU", combined_tax_rate: '5')
Province.create(name: 'Ontario', abbreviation: "ON", combined_tax_rate: '13')
Province.create(name: 'Prince Edward Island', abbreviation: "PE", combined_tax_rate: '15')
Province.create(name: 'Quebec', abbreviation: "QC", combined_tax_rate: '15')
Province.create(name: 'Saskatchewan', abbreviation: "SK", combined_tax_rate: '11')
Province.create(name: 'Yukon', abbreviation: "YT", combined_tax_rate: '5')

puts "Creating Admins..."
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Creating Categories..."
tea = Category.create(name: 'tea')
container = Category.create(name: 'container')

puts "Creating Products..."
tea.products.create(name: 'Lemon Ginger', description: 'A strongly flavoured herbal tea, with a hint of lemon', quantity: '25', price: '999', shipping_info: 'perishable')
tea.products.create(name: 'Vanilla Chai', description: 'A variant of chai tea flavoured with gentle notes of vanilla', quantity: '25', price: '999', shipping_info: 'perishable')
tea.products.create(name: 'Rooibos', description: 'A red tea made from the African Rooibos bush', quantity: '25', price: '999', shipping_info: 'perishable')
tea.products.create(name: 'Berry Blend', description: 'A mixture of raspberry, blackberry, and acai berry flavours', quantity: '25', price: '999', shipping_info: 'perishable')


container.products.create(name: 'Lobster Mug', description: 'A short mug with an image of a lobster on the side', quantity: '8', price: '499', shipping_info: 'fragile')
container.products.create(name: 'Flower Mug', description: 'A mediuim-sized mug with an image of a flower on the side', quantity: '5', price: '599', shipping_info: 'fragile')
container.products.create(name: 'Porcelain Cup', description: 'A petite and simplistic tea cup', quantity: '13', price: '499', shipping_info: 'fragile')
container.products.create(name: 'Porcelain Tea Pot', description: 'An elegant and minimalist tea pot', quantity: '5', price: '1399', shipping_info: 'fragile')
container.products.create(name: 'Ceramic Cup', description: 'A hardy and reliable tea cup', quantity: '11', price: '499', shipping_info: 'fragile')
container.products.create(name: 'Ceramic Tea Pot', description: 'A strudy and tasteful tea pot', quantity: '6', price: '1299', shipping_info: 'fragile')
