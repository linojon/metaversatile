class CreateSocialNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :social_networks do |t|
      t.string :name
      t.string :handle
      t.string :link
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
