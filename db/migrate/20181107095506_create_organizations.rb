class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :website
      t.string :scales
      t.text :description
      t.attachment :avatar
      t.string :website
      t.integer :founded
      t.attachment :form_cv
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
