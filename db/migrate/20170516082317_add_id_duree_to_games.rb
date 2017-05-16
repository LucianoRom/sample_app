class AddIdDureeToGames < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :duree, foreign_key: true
  end
end
