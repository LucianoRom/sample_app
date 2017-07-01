class CreateJeuNbJoueurs < ActiveRecord::Migration[5.0]
  def change
    create_table :jeu_nb_joueurs do |t|
      t.references :game, foreign_key: true
      t.references :nb_joueur, foreign_key: true

      t.timestamps
    end
  end
end
