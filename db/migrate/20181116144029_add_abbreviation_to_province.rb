class AddAbbreviationToProvince < ActiveRecord::Migration[5.2]
  def change
    add_column :provinces, :abbreviation, :string
  end
end
