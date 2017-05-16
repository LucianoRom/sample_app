class Version < ApplicationRecord
  has_many :jeu_versions, dependent: :destroy
  has_many :games, through: :jeu_versions
end
