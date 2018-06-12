class Stations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name 
      t.string :location
      t.integer :region_id
      t.string :type
      t.timestamps
    end
  end
end
