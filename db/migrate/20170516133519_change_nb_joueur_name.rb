class ChangeNbJoueurName < ActiveRecord::Migration[5.0]
  def change
    rename_table :nb_joueurs, :nbjoueurs
    rename_table :jeu_nb_joueurs, :jeu_nbjoueurs
  end
end
