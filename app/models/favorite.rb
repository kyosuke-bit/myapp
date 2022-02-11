# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_favorites_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#
class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :post_id, scope: :user_id
end
