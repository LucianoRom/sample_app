class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.datetime :date
      t.string :salle
      t.string :ville
      t.integer :orga

      t.timestamps
    end
  end
end
