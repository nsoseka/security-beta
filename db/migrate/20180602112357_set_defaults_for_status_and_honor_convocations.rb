class SetDefaultsForStatusAndHonorConvocations < ActiveRecord::Migration[5.1]
  def change
    change_column :convocations, :status, :boolean, default: false
    change_column :convocations, :honor_status, :boolean, default: false
  end
end
