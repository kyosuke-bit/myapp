# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class Comment < ApplicationRecord
  belongs_to :post
  has_many :goods, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 1000 }

  def good_user(user_id)
    goods.find_by(user_id: user_id)
  end
end
