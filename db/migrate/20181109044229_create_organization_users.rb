class CreateOrganizationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_users do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
