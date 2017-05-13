class AddActiveToApis < ActiveRecord::Migration[5.0]
  def change
    add_column :apis, :active, :boolean
  end
end
