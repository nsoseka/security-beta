class Archives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :archive_type
      t.integer :archive_id 
      t.text :description
      t.timestamps
    end
  end
end
