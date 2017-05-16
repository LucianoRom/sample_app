class Game < ApplicationRecord
  belongs_to :user
  belongs_to :complexite
  belongs_to :duree
  has_many :jeu_versions, dependent: :destroy
  has_many :versions, through: :jeu_versions
  has_many :jeu_ages, dependent: :destroy
  has_many :ages, through: :jeu_ages
  has_many :jeu_thematiques, dependent: :destroy
  has_many :thematiques, through: :jeu_thematiques
  has_many :jeu_nbjoueurs, dependent: :destroy
  has_many :nbjoueurs, through: :jeu_nbjoueurs
  has_many :jeu_ambiances, dependent: :destroy
  has_many :ambiances, through: :jeu_ambiances
  has_many :jeu_styles, dependent: :destroy
  has_many :styles, through: :jeu_styles
  validates :name, presence: true
  validates :user, presence: true
end
