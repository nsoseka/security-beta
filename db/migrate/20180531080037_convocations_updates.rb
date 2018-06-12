class ConvocationsUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :convocations_updates do |t|
      t.integer :convocation_id 
      t.integer :agent_id
      t.string :description
      t.boolean :old_value
      t.boolean :new_value
      t.timestamps
    end
  end
end
