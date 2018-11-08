class Province < ApplicationRecord
  has_many :jobs

  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.max_length_name}
end
