class Convictions < ActiveRecord::Migration[5.1]
  def change
    create_table :convictions do |t|
      t.text :charge 
      t.text :sentence 
      t.string :judge
      t.integer :agent_id 
      t.integer :citizen_id
      t.integer :court_id
      t.date :sentenced_on
      t.timestamps
    end
  end
end
