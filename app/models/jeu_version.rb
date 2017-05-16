class JeuVersion < ApplicationRecord
  belongs_to :game
  belongs_to :version
end
