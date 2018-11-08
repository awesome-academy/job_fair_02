class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.integer :gender
      t.string :phone
      t.string :address
      t.string :avatar

      t.timestamps
    end
  end
end
