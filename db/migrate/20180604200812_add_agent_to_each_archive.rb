class AddAgentToEachArchive < ActiveRecord::Migration[5.1]
  def change
    add_column :archives, :agent_id, :integer
  end
end
