class Citizens < ActiveRecord::Migration[5.1]
  def change
    create_table :citizens do |t|
      t.string :surname
      t.string :given_names
      t.date :date_of_birth
      t.string :father
      t.string :mother
      t.string :occupation
      t.string :address
      t.decimal :height, precision: 10, scale: 2
      t.string :sex
      t.string :sp 
      t.integer :id_card_number
      t.date :date_issued
      t.date :expiry_date
      t.string :passport_url
      t.timestamps
    end
  end
end
