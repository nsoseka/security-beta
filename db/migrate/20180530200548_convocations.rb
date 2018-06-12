class Convocations < ActiveRecord::Migration[5.1]
  def change
    create_table :convocations do |t|
      t.text :reason 
      t.date :date_expected 
      t.integer :citizen_id
      t.integer :convoker_id
      t.integer :station_id
      t.integer :agent_id
      t.boolean :convocation_status
      t.boolean :honor_status
      t.timestamps
    end
  end
end
