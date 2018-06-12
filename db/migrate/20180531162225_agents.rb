class Agents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string :role
      t.string :name
      t.integer :id_card_number
      t.string :service_id
      t.timestamps
    end
  end
end
