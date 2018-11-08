class Notification < ApplicationRecord
  belongs_to :user

  validates :content, present: true, length: {maximum: Settings.max_length_noti}
end
