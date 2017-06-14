class Age < ApplicationRecord
  has_many :jeu_ages, dependent: :destroy
  has_many :games, through: :jeu_ages
end
