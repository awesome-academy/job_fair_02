class CreateOrganizationCurriculumVitaes < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_curriculum_vitaes do |t|
      t.references :organization, foreign_key: true
      t.references :curriculum_vitae, foreign_key: true

      t.timestamps
    end
  end
end
