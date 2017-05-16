class JeuAmbiance < ApplicationRecord
  belongs_to :game
  belongs_to :ambiance
end
