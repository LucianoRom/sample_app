class CreateThematiques < ActiveRecord::Migration[5.0]
  def change
    create_table :thematiques do |t|
      t.string :name

      t.timestamps
    end
  end
end
