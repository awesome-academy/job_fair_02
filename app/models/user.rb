class User < ApplicationRecord
  has_many :curriculum_vitaes
  has_many :notifications
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :name, present: true, length: {maximum: Settings.max_length_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_length_mail},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :birthday, presence: true, date: true
  enum gender: %i(male female)
  validates :gender, inclusion: {in: genders.keys}
  validates :phone, presence: true, numericality: true,
    length: {minimum: Settings.min_length_phone,
             maximum: Settings.max_length_phone}
  validates :address, presence: true, length: {maximum: Settings.max_length_add}
end
