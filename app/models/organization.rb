class Organization < ApplicationRecord
  has_many :jobs
  has_many :organization_users
  has_many :users, through: :organization_users
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

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
    length: {maximum: Settings.max_length_experience}
  validates :scales, length: {maximum: Settings.max_length_mail}
  validates :founded, numericality: true
  validates :form_cv, length: {maximum: Settings.max_length_mail}
end
