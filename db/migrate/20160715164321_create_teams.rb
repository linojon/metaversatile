class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.references :project, foreign_key: true
      t.integer :status
      t.integer :role

      t.timestamps
    end
  end
end
