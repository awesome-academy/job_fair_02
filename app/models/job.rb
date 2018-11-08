class Job < ApplicationRecord
  belongs_to :organization
  belongs_to :province
  belongs_to :career
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :title, presence: true, length: {maximum: Settings.max_length_title}
  validates :age_from, :age_to, presence: true
  validates :skill, presence: true, length: {maximum: Settings.max_length_level}
  validates :salary, presence: true, numericality: true
  validates :work_address, presence: true,
    length: {maximum: Settings.max_length_address}
  validates :employment_type, presence: true,
    length: {maximum: Settings.max_length_level}
  validates :level, presence: true, length: {maximum: Settings.max_length_level}
  validates :description, presence: true,
    length: {maximum: Settings.max_length_description}
  validates :experience, presence: true,
    length: {maximum: Settings.max_length_experience}
end
