class CreateJeuAmbiances < ActiveRecord::Migration[5.0]
  def change
    create_table :jeu_ambiances do |t|
      t.references :game, foreign_key: true
      t.references :ambiance, foreign_key: true

      t.timestamps
    end
  end
end
