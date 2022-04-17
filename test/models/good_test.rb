# == Schema Information
#
# Table name: goods
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_goods_on_user_id_and_comment_id  (user_id,comment_id) UNIQUE
#
require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
