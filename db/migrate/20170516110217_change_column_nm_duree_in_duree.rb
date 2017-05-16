class ChangeColumnNmDureeInDuree < ActiveRecord::Migration[5.0]
  def change
    rename_column :durees, :nm_duree, :name
  end
end
