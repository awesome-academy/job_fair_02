class Notification < ApplicationRecord
  belongs_to :user

  validates :content, presence: true,
    length: {maximum: Settings.max_length_noti}

  scope :ordered, ->{order created_at: :desc}
end
