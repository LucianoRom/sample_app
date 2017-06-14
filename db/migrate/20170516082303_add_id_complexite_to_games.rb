class AddIdComplexiteToGames < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :complexite, foreign_key: true
  end
end
