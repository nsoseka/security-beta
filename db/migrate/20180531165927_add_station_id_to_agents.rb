class AddStationIdToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :station_id, :string
  end
end
