class ChangeRemoveFlagToRemoveFlags < ActiveRecord::Migration[5.1]
  def change
    rename_column :flags, :remove_flag, :remove
  end
end
