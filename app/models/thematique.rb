class Thematique < ApplicationRecord
  has_many :jeu_thematiques, dependent: :destroy
  has_many :games, through: :jeu_thematiques
end
