class AddTelephoneToCitizen < ActiveRecord::Migration[5.2]
  def change
    add_column :citizens, :telephone, :string
  end
end
