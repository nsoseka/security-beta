class ChangeTypeToGenre < ActiveRecord::Migration[5.1]
  def change
    rename_column :restrictions, :type, :genre
  end
end
