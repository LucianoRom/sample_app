class ChangeColumnNmComplexityInComplexity < ActiveRecord::Migration[5.0]
  def change
    rename_column :complexites, :nm_complexite, :name
  end
end
