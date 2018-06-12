class Restrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :restrictions do |t|
      t.string :restriction_type
      t.text :restriction_description
      t.integer :agent_id
      t.integer :citizen_id
      t.integer :station_id
      t.timestamps
    end
  end
end
