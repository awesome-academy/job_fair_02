class Organization < ApplicationRecord
  acts_as_taggable

  has_many :jobs
  has_many :organization_users
  has_many :users, through: :organization_users
  has_attached_file :avatar,
    styles: {med: Settings.avatar_medium}
  has_attached_file :form_cv

  validates :name, presence: true, length: {maximum: Settings.max_length_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_length_mail},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :phone, presence: true, numericality: true,
    length: {minimum: Settings.min_length_phone,
             maximum: Settings.max_length_phone}
  validates :address, presence: true,
    length: {maximum: Settings.max_length_address}
  validates :website, length: {maximum: Settings.max_length_mail}
  validates :description, presence: true,
    length: {maximum: Settings.max_length_description}
  validates :scales, length: {maximum: Settings.max_length_mail}
  validates :founded, numericality: true
  validates :form_cv, length: {maximum: Settings.max_length_mail}
  validates_attachment :avatar,
    content_type: {content_type: Settings.type_avatar.to_a},
    size: {less_than: Settings.size_avatar.kilobytes}
  validates_attachment :form_cv,
    content_type:
      {content_type: Settings.type_form.to_a},
    url: Settings.url_form,
    path: Settings.path_form,
    size: {less_than: Settings.size_cv.megabytes}

  ORGANIZATION_ATTRS = [:name, :email, :phone, :address, :website,
    :scales, :founded, :description, :avatar, :verified,
    :form_cv, :tag_list].freeze
end
