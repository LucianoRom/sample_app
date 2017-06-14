class CreateJeuThematiques < ActiveRecord::Migration[5.0]
  def change
    create_table :jeu_thematiques do |t|
      t.references :game, foreign_key: true
      t.references :thematique, foreign_key: true

      t.timestamps
    end
  end
end
