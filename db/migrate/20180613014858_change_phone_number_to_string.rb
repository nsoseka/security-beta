class ChangePhoneNumberToString < ActiveRecord::Migration[5.2]
  def change
    change_column :agents, :phone_number, :string
  end
end
