class AddBirthLocationCitizens < ActiveRecord::Migration[5.2]
  def change
    add_column :citizens, :born_at, :string
  end
end
