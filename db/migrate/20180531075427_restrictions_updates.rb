class RestrictionsUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :restrictions_updates do |t|
      t.integer :restriction_id 
      t.integer :agent_id
      t.string :description
      t.boolean :old_value
      t.boolean :new_value
      t.timestamps
    end
  end
end
