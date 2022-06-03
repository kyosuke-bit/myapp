# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many_attached :images

  validates :content, length: { maximum: 200 }

  def post_datetime
    weeks = ["日","月","火","水","木","金","土"]
    post_date = self.updated_at.strftime("%Y/%m/%d")
    post_week = weeks[self.updated_at.wday]

    if post_date == Time.current.strftime("%Y/%m/%d")
      return "今日"
    elsif post_date == (Time.current - 1.days).strftime("%Y/%m/%d")
      return "昨日"
    else
      return post_date + "(#{post_week})"
    end
  end
end
