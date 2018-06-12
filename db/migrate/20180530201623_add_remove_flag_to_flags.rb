class AddRemoveFlagToFlags < ActiveRecord::Migration[5.1]
  def change
    add_column :flags, :remove_flag, :boolean
  end
end
