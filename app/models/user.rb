# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  has_one :profile, dependent: :destroy
  has_many :favorites

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 }
  validates :password,
    length: { minimum: 8 }
end
