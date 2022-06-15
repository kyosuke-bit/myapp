# == Schema Information
#
# Table name: profile_favorite_product_relations
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  favorite_product_id :bigint           not null
#  profile_id          :bigint           not null
#
# Indexes
#
#  index_profile_favorite_product_relations_on_favorite_product_id  (favorite_product_id)
#  index_profile_favorite_product_relations_on_profile_id           (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (favorite_product_id => favorite_products.id)
#  fk_rails_...  (profile_id => profiles.id)
#
class ProfileFavoriteProductRelation < ApplicationRecord
  belongs_to :profile
  belongs_to :favorite_product
end
