class Style < ApplicationRecord
  has_many :jeu_styles, dependent: :destroy
  has_many :games, through: :jeu_styles
end
