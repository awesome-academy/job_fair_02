class CreateCurriculumVitaeJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculum_vitae_jobs do |t|
      t.references :job, foreign_key: true
      t.references :curriculum_vitae, foreign_key: true

      t.timestamps
    end
  end
end
