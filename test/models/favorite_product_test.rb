# == Schema Information
#
# Table name: favorite_products
#
#  id           :bigint           not null, primary key
#  product_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class FavoriteProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
