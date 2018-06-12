class FlagsUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :flags_updates do |t|
      t.integer :flag_id
      t.integer :agent_id
      t.string :description
      t.boolean :old_value
      t.boolean :new_value
      t.timestamps
    end
  end
end
