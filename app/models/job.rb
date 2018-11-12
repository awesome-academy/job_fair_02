class Job < ApplicationRecord
  belongs_to :organization
  belongs_to :province
  belongs_to :career
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :title, presence: true, length: {maximum: Settings.max_length_title}
  validates :age_from, :age_to, presence: true, numericality: true,
    inclusion: {in: Settings.age_from.to_i..Settings.age_to.to_i}
  validates :skill, presence: true, length: {maximum: Settings.max_length_level}
  validates :salary, presence: true, numericality: true
  validates :work_address, presence: true,
    length: {maximum: Settings.max_length_add}
  validates :employment_type, presence: true,
    length: {maximum: Settings.max_length_level}
  validates :description, presence: true,
    length: {maximum: Settings.max_length_description}
  validate :check_expried
  validates :experience, presence: true,
    length: {maximum: Settings.max_length_experience}

  JOB_ATTRS = [:organization_id, :career_id, :province_id,
    :title, :age_from, :age_to, :salary, :work_address, :employment_type,
    :skill, :level, :experience, :description, :expiration_date].freeze

  private

  def check_expried
    return unless expiration_date.presence
    return if expiration_date > Date.current
    errors.add :age_to, I18n.t(".expiration_date")
  end
end
