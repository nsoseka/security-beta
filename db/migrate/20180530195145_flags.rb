class Flags < ActiveRecord::Migration[5.1]
  def change
    create_table :flags do |t|
      t.text :reason 
      t.integer :citizen_id 
      t.integer :agent_id
      t.integer :station_id 
      t.integer :level_of_severity
      t.timestamps
    end
  end
end
