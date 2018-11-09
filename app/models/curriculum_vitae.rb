class CurriculumVitae < ApplicationRecord
  belongs_to :user
  has_many :curriculum_vitae_details, dependent: :destroy
  has_many :curriculum_vitae_jobs, dependent: :destroy
  has_many :jobs, through: :curriculum_vitae_jobs,
    dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :industry, presence: true,
    length: {maximum: Settings.max_length_title}
  validates :target, presence: true,
    length: {maximum: Settings.max_length_target}
  validates :experience, presence: true,
    length: {maximum: Settings.max_length_experience}
  validates :skill, presence: true, length: {maximum: Settings.max_length_level}
  validates :language, presence: true,
    length: {maximum: Settings.max_length_lang}
end
