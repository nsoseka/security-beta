class AddPasswordConfirmationToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :password_confirmation, :string
  end
end
