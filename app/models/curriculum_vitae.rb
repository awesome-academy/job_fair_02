class CurriculumVitae < ApplicationRecord
  acts_as_taggable
  belongs_to :user

  has_many :curriculum_vitae_details, dependent: :destroy
  has_many :curriculum_vitae_jobs, dependent: :destroy
  has_many :jobs, through: :curriculum_vitae_jobs,
    dependent: :destroy

  has_attached_file :cv_upload
  accepts_nested_attributes_for :curriculum_vitae_details, allow_destroy: true,
    reject_if: :all_blank

  validates :industry, presence: true,
    length: {maximum: Settings.max_length_title}
  validates :target, presence: true,
    length: {maximum: Settings.max_length_target}
  validates :experience, presence: true,
    length: {maximum: Settings.max_length_experience}
  validates :skill, presence: true, length: {maximum: Settings.max_length_level}
  validates :language, presence: true,
    length: {maximum: Settings.max_length_lang}
  validates_attachment :cv_upload,
    content_type: {content_type: "application/pdf"},
    url: Settings.url_form,
    path: Settings.path_form

  CURRICULUM_VITAE_PARAMS = [:industry, :target, :experience, :skill, :language,
    :public, :tag_list, curriculum_vitae_details_attributes:
      %i(id title content _destroy)].freeze

  delegate :avatar, :name, :address, :email, :phone, :gender, :birthday,
    to: :user
end
