# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user
  has_many :comments, dependent: :delete_all
  has_many :post_category_relations, dependent: :delete_all
  has_many :categories, through: :post_category_relations
  has_many :favorites, dependent: :destroy

  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }
end
