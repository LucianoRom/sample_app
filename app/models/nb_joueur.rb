class NbJoueur < ApplicationRecord
  has_many :jeu_nb_joueurs, dependent: :destroy
  has_many :games, through: :jeu_nb_joueurs
end
