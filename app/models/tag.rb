class Tag < ApplicationRecord
  has_many :taggings

  validates :name, present: true, length: {maximum: Settings.max_length_tag}
end
