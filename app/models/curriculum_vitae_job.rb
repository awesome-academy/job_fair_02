class CurriculumVitaeJob < ApplicationRecord
  belongs_to :job
  belongs_to :curriculum_vitae

  validates :job, uniqueness: { scope: :curriculum_vitae_id }
end
