class CreateDurees < ActiveRecord::Migration[5.0]
  def change
    create_table :durees do |t|
      t.string :nm_duree

      t.timestamps
    end
  end
end
