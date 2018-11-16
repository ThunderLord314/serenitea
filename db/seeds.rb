# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Product.create(name: 'Lemon Ginger', description: 'A strongly flavoured herbal tea, with a hint of lemon', quantity: '25', price: '9.99', shipping_info: 'perishable', category: 'tea')
Product.create(name: 'Vanilla Chai', description: 'A variant of chai tea flavoured with gentle notes of vanilla', quantity: '25', price: '9.99', shipping_info: 'perishable', category: 'tea')
Product.create(name: 'Rooibos', description: 'A red tea made from the African Rooibos bush', quantity: '25', price: '9.99', shipping_info: 'perishable', category: 'tea')
Product.create(name: 'Berry Blend', description: 'A mixture of raspberry, blackberry, and acai berry flavours', quantity: '25', price: '9.99', shipping_info: 'perishable', category: 'tea')
Product.create(name: 'Lobster Mug', description: 'A short mug with an image of a lobster on the side', quantity: '8', price: '4.99', shipping_info: 'fragile', category: 'container')
Product.create(name: 'Flower Mug', description: 'A mediuim-sized mug with an image of a flower on the side', quantity: '5', price: '5.99', shipping_info: 'fragile', category: 'container')
Product.create(name: 'Porcelain Cup', description: 'A petite and simplistic tea cup', quantity: '13', price: '4.99', shipping_info: 'fragile', category: 'container')
Product.create(name: 'Porcelain Tea Pot', description: 'An elegant and minimalist tea pot', quantity: '5', price: '13.99', shipping_info: 'fragile', category: 'container')
Product.create(name: 'Ceramic Cup', description: 'A hardy and reliable tea cup', quantity: '11', price: '4.99', shipping_info: 'fragile', category: 'container')
Product.create(name: 'Ceramic Tea Pot', description: 'A strudy and tasteful tea pot', quantity: '6', price: '12.99', shipping_info: 'fragile', category: 'container')
