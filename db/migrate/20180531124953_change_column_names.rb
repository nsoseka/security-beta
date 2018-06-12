class ChangeColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :flags, :level_of_severity, :severity
    rename_column :convocations, :convocation_status, :status
  end
end
