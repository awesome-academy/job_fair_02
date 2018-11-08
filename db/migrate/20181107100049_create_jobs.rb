class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :career, foreign_key: true
      t.references :organization, foreign_key: true
      t.references :province, foreign_key: true
      t.string :title
      t.integer :age_from
      t.integer :age_to
      t.string :skill
      t.integer :salary
      t.string :work_address
      t.string :employment_type
      t.string :level
      t.text :description
      t.string :experience
      t.date :expiration_date

      t.timestamps
    end
  end
end

