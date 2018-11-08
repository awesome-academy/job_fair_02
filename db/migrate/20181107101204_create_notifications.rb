class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :target_type
      t.integer :target_id
      t.string :content
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
