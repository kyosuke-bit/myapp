# == Schema Information
#
# Table name: profiles
#
#  id              :bigint           not null, primary key
#  birthday        :date
#  first_name      :string(255)
#  first_name_kana :string(255)
#  last_name       :string(255)
#  last_name_kana  :string(255)
#  nickname        :string(255)
#  phone_number    :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  prefecture_id   :integer
#  user_id         :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
  has_one_attached :icon
  belongs_to :user
  has_many :profile_favorite_product_relations, dependent: :delete_all
  has_many :favorite_products, through: :profile_favorite_product_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture, optional: true

  VALID_PHONE_NUMBER_REGEX = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :first_name, length: { maximum: 10 }
  validates :last_name, length: { maximum: 10 }
  validates :first_name_kana, length: { maximum: 15 }
  validates :last_name_kana, length: { maximum: 15 }
  validates :nickname, length: { maximum: 15 }
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }, allow_blank: true
end
