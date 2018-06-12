class ChangePhoneNumberType < ActiveRecord::Migration[5.1]
  def change
    change_column :agents, :phone_number, :string
  end
end
