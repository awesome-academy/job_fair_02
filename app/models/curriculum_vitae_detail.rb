class CurriculumVitaeDetail < ApplicationRecord
  belongs_to :curriculum_vitae

  validates :title, present: true, length: {maximum: Settings.max_length_name}
  validates :content, present: true, length: {maximum: Settings.max_length_content}
end
