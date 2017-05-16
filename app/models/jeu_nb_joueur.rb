class JeuNbJoueur < ApplicationRecord
  belongs_to :game
  belongs_to :nb_joueur
end
