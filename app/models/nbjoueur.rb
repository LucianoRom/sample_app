class Nbjoueur < ApplicationRecord
  has_many :jeu_nbjoueurs, dependent: :destroy
  has_many :games, through: :jeu_nbjoueurs
end
