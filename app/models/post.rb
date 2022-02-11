# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
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
