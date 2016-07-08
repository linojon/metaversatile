class CreateProfileSkills < ActiveRecord::Migration
  def change
    create_table :profile_skills do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
