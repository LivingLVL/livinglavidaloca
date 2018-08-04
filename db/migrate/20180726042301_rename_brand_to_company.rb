class RenameBrandToCompany < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :brand, :company
  end
end
