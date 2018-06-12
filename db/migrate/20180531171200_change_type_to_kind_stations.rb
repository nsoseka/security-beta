class ChangeTypeToKindStations < ActiveRecord::Migration[5.1]
  def change
    rename_column :stations, :type, :kind
  end
end
