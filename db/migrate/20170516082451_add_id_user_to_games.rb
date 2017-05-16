class AddIdUserToGames < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :user, foreign_key: true
  end
  add_index :games, :name
  add_index :games, [:name, :user_id]


end
