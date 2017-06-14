class Ambiance < ApplicationRecord
  has_many :jeu_ambiances, dependent: :destroy
  has_many :games, through: :jeu_ambiances
end
