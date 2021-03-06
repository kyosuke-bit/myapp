# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
  (1..50).each do |i|
    Post.create!(title: "タイトル#{i}", body: "本文#{i}", user_id: 1)
  end

  # Category.create([
  #   { name: 'product1' },
  #   { name: 'product2' },
  #   { name: 'product3' },
  #   { name: 'product4' },
  #   { name: 'product5' }
  # ])
  #
  # FavoriteProduct.create ([
  #   { product_name: 'product1' },
  #   { product_name: 'product2' },
  #   { product_name: 'product3' },
  #   { product_name: 'product4' },
  #   { product_name: 'product5' }
  # ])
end
