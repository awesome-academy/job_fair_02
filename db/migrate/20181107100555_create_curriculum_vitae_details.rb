class CreateCurriculumVitaeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculum_vitae_details do |t|
      t.references :curriculum_vitae, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
