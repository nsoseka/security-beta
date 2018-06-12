class AddDefaultToFlagRemoveFlags < ActiveRecord::Migration[5.1]
  def change
    change_column :flags, :remove, :boolean, default: false
  end
end
