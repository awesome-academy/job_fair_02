class Tag < ApplicationRecord
  has_many :taggings

  validates :name, presence: true, length: {maximum: Settings.max_length_tag}

  acts_as_followable
end
