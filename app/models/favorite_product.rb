# == Schema Information
#
# Table name: favorite_products
#
#  id           :bigint           not null, primary key
#  product_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class FavoriteProduct < ApplicationRecord
  has_many :profile_favorite_product_relations, dependent: :delete_all
  has_many :profiles, through: :profile_favorite_product_relations
end
