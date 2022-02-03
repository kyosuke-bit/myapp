# == Schema Information
#
# Table name: profiles
#
#  id              :bigint           not null, primary key
#  birthday        :date             not null
#  first_name      :string(255)      not null
#  first_name_kana :string(255)      not null
#  last_name       :string(255)      not null
#  last_name_kana  :string(255)      not null
#  nickname        :string(255)      not null
#  phone_number    :string(255)      not null
#  prefectures     :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
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
require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
