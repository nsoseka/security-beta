class ChangeColumnNamesForRestrictions < ActiveRecord::Migration[5.1]
  def change
    rename_column :restrictions, :restriction_type, :type 
    rename_column :restrictions, :restriction_description, :description
    rename_column :restrictions, :remove_restriction, :remove
  end
end
