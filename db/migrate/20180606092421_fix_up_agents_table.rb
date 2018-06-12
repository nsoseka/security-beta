class FixUpAgentsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :full_name, :string
    add_column :agents, :email, :string
    add_column :agents, :phone_number, :number 
    add_column :agents, :password_digest, :string
    add_column :agents, :verification_status, :boolean, default: false
    add_column :agents, :email_verification_status, :boolean, default: true
    rename_column :agents, :name, :username
  end
end
