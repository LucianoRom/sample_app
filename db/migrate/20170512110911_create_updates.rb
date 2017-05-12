class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.text :detail
      t.integer :status

      t.timestamps
    end
  end
end
