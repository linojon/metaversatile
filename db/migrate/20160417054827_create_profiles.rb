class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :email
      t.string :username
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
