class CreateJeuAges < ActiveRecord::Migration[5.0]
  def change
    create_table :jeu_ages do |t|
      t.references :game, foreign_key: true
      t.references :age, foreign_key: true

      t.timestamps
    end
  end
end
