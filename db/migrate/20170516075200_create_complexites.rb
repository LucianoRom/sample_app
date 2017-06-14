class CreateComplexites < ActiveRecord::Migration[5.0]
  def change
    create_table :complexites do |t|
      t.string :nm_complexite

      t.timestamps
    end
  end
end
