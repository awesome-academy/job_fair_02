class CreateCurriculumVitaes < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculum_vitaes do |t|
      t.references :user, foreign_key: true
      t.string :industry
      t.text :target
      t.string :experience
      t.string :skill
      t.string :language
      t.string :cv_upload
      t.boolean :public

      t.timestamps
    end
  end
end
