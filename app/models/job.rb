class Job < ApplicationRecord
  belongs_to :organization
  belongs_to :province
  belongs_to :career
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :title, present: true, length: {maximum: Settings.max_length_title}
  validates :age_from, :age_to, present: true
  validates :skill, present: true, length: {maximum: Settings.max_length_level}
  validates :salary, presence: true, numericality: true
  validates :work_address, presence: true,
    length: {maximum: Settings.max_length_address}
  validates :employment_type, presence: true,
    length: {maximum: Settings.max_length_level}
  validates :level, present: true, length: {maximum: Settings.max_length_level}
  validates :description, present: true,
    length: {maximum: Settings.max_length_description}
  validates :experience, present: true,
    length: {maximum: Settings.max_length_experience}
end
