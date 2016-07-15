class AddFieldsToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :headline, :string
    add_column :profiles, :industry, :integer
    add_column :profiles, :location, :string
    add_column :profiles, :bio, :textarea
    add_column :profiles, :birthday, :date

  end
end
