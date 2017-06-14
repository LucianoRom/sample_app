class JeuThematique < ApplicationRecord
  belongs_to :game
  belongs_to :thematique
end
