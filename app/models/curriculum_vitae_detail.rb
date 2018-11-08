class CurriculumVitaeDetail < ApplicationRecord
  belongs_to :curriculum_vitae

  validates :title, presence: true, length: {maximum: Settings.max_length_name}
  validates :content, presence: true,
    length: {maximum: Settings.max_length_content}
end
